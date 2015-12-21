require 'acts_as_indexed'

module Refinery
  module Jobs
    class Job < ActiveRecord::Base
      extend FriendlyId
      self.table_name = 'refinery_jobs'

      translates :title, :description, :slug, :education, :experience, :skills, :languages, :salary, :length, :contact

      friendly_id :friendly_id_source, use:[:slugged, :finders, :globalize]

      acts_as_indexed fields: [:title, :description, :employment_terms, :hours]

      has_many :job_applications, dependent: :destroy, foreign_key: :job_id

      validates_presence_of   :title, :description
      validates_uniqueness_of :title

      validates_length_of :title, :employment_terms, :ref, :education, :experience,
        :skills, :languages, :salary, :hours, :employment_terms, :length, :contact, maximum: 255


      # If title changes tell friendly_id to regenerate slug when
      # saving record
      def should_generate_new_friendly_id?
        title_changed?
      end

      def friendly_id_source
        title
      end

      def self.latest(number = 5)
        limit(number).order('created_at DESC')
      end

      def live?
        !draft && published_at <= DateTime.now
      end

      class << self

        # Wrap up the logic of finding the pages based on the translations table.
        def with_globalize(conditions = {})
          conditions = {:locale => ::Globalize.locale}.merge(conditions)
          globalized_conditions = {}
          conditions.keys.each do |key|
            if (translated_attribute_names.map(&:to_s) | %w(locale)).include?(key.to_s)
              globalized_conditions["#{self.translation_class.table_name}.#{key}"] = conditions.delete(key)
            end
          end
          # A join implies readonly which we don't really want.
          where(conditions).joins(:translations).where(globalized_conditions)
                           .readonly(false)
        end

        def find_by_slug_or_id(slug_or_id)
          if slug_or_id.friendly_id?
            find_by_slug(slug_or_id)
          else
            find(slug_or_id)
          end
        end

        def published_before(date=DateTime.now)
          where(arel_table[:published_at].lt(date))
            .where(draft: false)
            .with_globalize
        end
        alias_method :live, :published_before
      end
    end
  end
end
