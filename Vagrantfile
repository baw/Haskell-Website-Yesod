Vagrant.configure("2") do |config|
    config.vm.box = 'lazygray/heroku-cedar-14'
    config.vm.network "forwarded_port", guest: 3000, host: 3000
    config.vm.provider "virtualbox" do |v|
        v.name = "Test_Environment"
        v.memory = 1024
    end

    config.vm.provision "shell", inline: <<-SHELL
        echo Create postgres user
        sudo -u postgres psql -c "CREATE USER vagrant WITH PASSWORD 'password';"
        sudo -u postgres createdb -O vagrant website
        echo Set /vargrant directory to load on ssh
        echo "cd /vagrant" >> /home/vagrant/.bashrc

        echo Installing stack
        curl -sSL https://get.haskellstack.org/ | sh
    SHELL

    config.vm.provision "shell", run: "always", inline: <<-SHELL
        echo Adding enviromental variables
        > /etc/profile.d/env_vars.sh
        echo "export PGUSER=vagrant; export PGPASS=password" >> /etc/profile.d/env_vars.sh
    SHELL
end
