# Selenium Helm Chart
Create/Upgrade Chart
```
helm upgrade --install --reuse-values --wait --timeout 600s seleniumistio ../$(basename "$PWD") 
helm upgrade --install --wait --timeout 600s seleniumistio ../$(basename "$PWD") 
```
Uninstall Chart
```
helm uninstall  seleniumistio ../$(basename "$PWD") 
```

Test
```
http://192.168.1.20:31012
```
