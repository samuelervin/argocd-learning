# argocd-learning


start argo:
```
kubectl port-forward svc/argocd-server -n argocd 8080:80
```
manually apply application to view in argo:
```
kubectl apply -f example1/application.yaml
```
Go into argo and sync the deployment. 
Now look in k8s to see if the pods exist
```
kubectl get pods -n prod
``