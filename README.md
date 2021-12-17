# onleihe-monitor
Bash/XSLT scripts for monitoring onleihe.de for new editions of magazines and notification via telegram

## Configuration
### `telegram-config.cfg`
change `botId`

### `repo-config.cfg`
- change `BASE_URL` of your desired onleihe
- add "versionInfoList" resources of your desired magazines (under `magazinUrls`)

Thus https://www.onleihe.de/chemnitz/frontend/versionInfoList,0-0-0-109-0-0-0-2008-400005-400750250-0.html
would become:
```
BASE_URL="https://www.onleihe.de/chemnitz/frontend/"
magazinUrls= ( \ 
  versionInfoList,0-0-0-109-0-0-0-2008-400005-400750250-0.html \ # some comment to remember this is chefkoch
)
```

## Run ##
### One-time execution ###
`./onleihe-monitor.sh`

### Actual monitoring ### 
Set up cron job as desired. Be sure to change into the script directory.
```
*/5 * *    *   *    ( cd ~/onleihe && ./onleihe-monitor.sh )
```

## Requirements/Dependencies ##
- your personal telegram bot
- Bash
- xsltproc
