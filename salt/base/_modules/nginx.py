# encoding: utf-8
import os
import commands

def version():
    version = commands.getoutput("nginx -v")
    if 'version' in version:
        return  version
    return  False

def service(cmd):
    parm = ['start','status','stop','restart','reload']
    if cmd not in parm:
        return 'command not exists'
    command = commands.getoutput("systemctl %s nginx" %cmd)
    # command = commands.getoutput("/usr/sbin/nginx %s" %cmd)
    return command

