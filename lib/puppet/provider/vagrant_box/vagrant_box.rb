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
<<<<<<< HEAD

    args = [
      "box",
      "remove",
      name,
      --provider,
      @resource[:vprovider],
    ]

    vagrant(*args)
=======
    vagrant "box", "remove", @resource[:source], "--provider", @resource[:vprovider]
>>>>>>> f6455ba70266a33f0687feb355a1cdc7bd1b8091
  end

  def exists?
    if @resource[:force]
      false
    else
<<<<<<< HEAD
      boxes = vagrant "box", "list"
      if @resource[:source] =~ /^http/
        match = name
      else
        match = @resource[:source]
      end
      boxes =~ /^#{match}\s+\(#{@resource[:vprovider]}(, .+)?\)/
=======
      name = @resource[:source]
      vprovider = @resource[:vprovider]

      boxes = vagrant "box", "list"
      boxes =~ /^#{name}\s+\(#{vprovider}(, .+)?\)/
>>>>>>> f6455ba70266a33f0687feb355a1cdc7bd1b8091
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
<<<<<<< HEAD

=======
>>>>>>> f6455ba70266a33f0687feb355a1cdc7bd1b8091
end
