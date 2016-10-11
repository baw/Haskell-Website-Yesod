Vagrant.configure("2") do |config|
    config.vm.box = 'lazygray/heroku-cedar-14'
    config.vm.network "forwarded_port", guest: 3000, host: 3000
    config.vm.provider "virtualbox" do |v|
        v.name = "Test_Environment"
        v.memory = 2048
    end

    config.vm.provision "shell", inline: <<-SHELL
        echo Create postgres user
        sudo -u postgres psql -c "CREATE USER vagrant;"
        sudo -U vagrant psql -c "CREATE DATABASE website;"
    SHELL

    config.vm.provision "shell", run: "always", inline: <<-SHELL
        echo Adding enviromental variables
        > /etc/profile.d/env_vars.sh
        echo "export PGUSER=vagrant; export PGPASS=password" >> /etc/profile.d/env_vars.sh
    SHELL
end
