legion-of-doom
==============

Why? Because it's a *group* of *Lex*, *see*?

No? Nevermind.

This is a simple, hacky, yet functional frontend for my [LXC MCollective agent](https://github.com/br0ch0n/mcollective-lxc-agent).  It gives you a basic web interface to manage all of your containers across your LXC "cluster".  

* You can start, stop, create and destroy containers.
* It's a [Sinatra](http://www.sinatrarb.com/) app made to look slightly nice-ish via [Bootstrap](http://getbootstrap.com/).
* Shout-outs to [https://github.com/maguec/mco_dashboard_example](https://github.com/maguec/mco_dashboard_example) and [https://github.com/lxc-webpanel/LXC-Web-Panel](https://github.com/lxc-webpanel/LXC-Web-Panel)

Requirements and Notes
----------------------
* You'll need to run this on a box that already has a functional [LXC MCollective](https://github.com/br0ch0n/mcollective-lxc-agent) client installed.
* Also make sure you start the server as a user with appropriate rights to your collective.
* Only other requirement is the Sinatra gem.

Install and Run
---------------
    me@client:~$ sudo gem install sinatra
    Successfully installed sinatra-1.4.5
    1 gem installed
    Installing ri documentation for sinatra-1.4.5...

    me@client:~$ git clone https://github.com/br0ch0n/legion-of-doom
    me@client:~$ cd legion-of-doom
    me@client:~$ sudo RACK_ENV=production ruby legion.rb

    [2014-09-10 09:18:02] INFO  WEBrick 1.3.1
    [2014-09-10 09:18:02] INFO  ruby 1.9.3 (2013-11-22) [x86_64-linux]
    == Sinatra/1.4.5 has taken the stage on 4567 for production with backup from WEBrick
    [2014-09-10 09:18:02] INFO  WEBrick::HTTPServer#start: pid=6959 port=4567

    
Screenshots
-----------
![all hosts screen](/public/assets/allhosts.jpg?raw=true "All Hosts")
![create container screen](/public/assets/create.jpg?raw=true "Create New Container")
    

