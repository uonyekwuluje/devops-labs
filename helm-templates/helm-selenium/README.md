# Selenium Helm Chart
Create/Upgrade Chart
```
helm upgrade --install --reuse-values --wait --timeout 600s selenium ../$(basename "$PWD") 
helm upgrade --install --wait --timeout 600s selenium ../$(basename "$PWD") 
```
Uninstall Chart
```
helm uninstall  selenium ../$(basename "$PWD") 
```

Test
```
http://192.168.1.20:30001
```
