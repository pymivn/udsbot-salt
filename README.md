# Salt itself is a moving target, as of 2025 it's under VMWare and no longer support install via pip
# switched to other less-moving solution.

# udsbot Salt formula

Salt formula for installing [Telegram bot udsbot](https://github.com/pymivn/udsbot)

Tested on Ubuntu 18.04 with systemd


## Test

Using latest [vagrant](https://learn.hashicorp.com/tutorials/vagrant/getting-started-index)
or any version >=v2.2.8 which contains the fix for running Vagrant provision Salt on Python3
[fix contributed by me ^^](https://github.com/hashicorp/vagrant/pull/11436/files).

```
make test
```

### vagrant tutorial [vi]
https://www.familug.org/2020/02/vagrant.html
