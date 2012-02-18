# This file (production.rb) is the first file loaded opening a production.  It must define a module named 'Production'.
# The containing production will acquire all the behavior defined in this module.
# You may define serveral hooks and initialization steps here.

module Production
  attr_reader :config
  attr_writer :randomizer

  def randomizer
    @randomizer ||= Randomizer.new(FilesystemNameRepository.new(@config["names_list_path"]), @config["persist_used_names"])
  end

#  # Define this method if you want the production name to be different from the default, directory name.
#  def name
#    return "Solari"
#  end
#
#  # Returns the minimum version of limelight required to run this production.  Default: "0.0.0"
#  # If the version of limelight used to open this production is less than the minimum,
#  # an error will be displayed (starting with version 0.4.0).
#  #
#  def minimum_limelight_version
#    return "0.5.11"
#  end
#
#  # Hook #1.  Called when the production is newly created, before any loading has been done.
#  # This is a good place to require needed files and instantiate objects in the business layer.
  def production_opening
    $: << File.expand_path(File.dirname(__FILE__) + "/lib")
    require 'filesystem_name_repository'
    require 'randomizer'
    require 'yaml'
    require 'erb'
    load_config
  end

  def load_config
    config_yml = File.read(File.expand_path(File.dirname(__FILE__) + "/config/solari.yml"))
    env = ENV["SOLARI_ENV"] || "production"
    @config = YAML::load(ERB.new(config_yml).result)[env]
  end
#
  # Hook #2.  Called after internal gems have been loaded and stages have been instantiated, yet before
  # any scenes have been opened.
#  def production_loaded
#    require 'randomizer'
#  end
#
#  # Hook #3.  Called when the production, and all the scenes, have fully opened.
#  def production_opened
#  end
#
#  # The system will call this methods when it wishes to close the production, perhaps when the user quits the
#  # application.  By default the production will always return true. You may override this behavior by re-implenting
#  # the methods here.
#  def allow_close?
#    return true
#  end
#
#  # Called when the production is about to be closed.
#  def production_closing
#  end
#
#  # Called when the production is fully closed.
#  def production_closed
#  end

end
