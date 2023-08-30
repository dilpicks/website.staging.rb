module Presenters
  module NameifyPresenter
    extend ActiveSupport::Concern

    def display_name
      self.try(:title) || self.try(:name)
    end

    def _class_name
      self.class.name.demodulize
    end

    def _table_name
      self.class.name.demodulize.tableize
    end

    def _model_name
      self.class.name.demodulize.tableize.singularize
    end

    def _translation
      I18n.t("models.#{_table_name}.model_name")
    end

    def _module_names
      self.class.name.deconstantize.split('::')
    end

    def _parent_module_name
      self.class.module_parent.name
    end
  end
end
