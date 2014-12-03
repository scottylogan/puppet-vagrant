require 'puppet/util/execution'

Puppet::Type.type(:vagrant_box).provide :vagrant_box do
  include Puppet::Util::Execution

  def create

    args = [
      "box",
      "add",
      @resource[:source],
      "--provider",
      @resource[:vprovider],
    ]

    args << "--force" if @resource[:force]

    vagrant(*args)
  end

  def destroy

    args = [
      "box",
      "remove",
      name,
      --provider,
      @resource[:vprovider],
    ]

    vagrant(*args)
  end

  def exists?
    if @resource[:force]
      false
    else
      boxes = vagrant "box", "list"
      if @resource[:source] =~ /^http/
        match = name
      else
        match = @resource[:source]
      end
      boxes =~ /^#{match}\s+\(#{@resource[:vprovider]}(, .+)?\)/
    end
  end

  private
  def custom_environment
    {
      "HOME"         => "/Users/#{Facter[:boxen_user].value}",
      "VAGRANT_HOME" => "/Users/#{Facter[:boxen_user].value}/.vagrant.d",
    }
  end

  def opts
    {
      :combine            => true,
      :custom_environment => custom_environment,
      :failonfail         => true,
      :uid                => Facter[:boxen_user].value,
    }
  end

  def vagrant(*args)
    cmd = ["/usr/bin/vagrant"] + args
    execute cmd, opts
  end

end
