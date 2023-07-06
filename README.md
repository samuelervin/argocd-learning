# argocd-learning

1. switch to terraform environment
   ```
   cd terraform
   ```
2. Init Terraform
   ```
   terraform init
   ```
3. apply the helm chart for Argo with terraform
  ```
    terraform apply
  ```
1. check argo helm chart is installed
   ```
   helm list -A 
   ```
2. check that ArgoCD pods are running
   ```
   kubectl get pods -n argocd 
   ```
3. Get the default generated admin secret

   ```
   kubectl get secrets -n argocd
   ```
4. Get secret in yaml format 

```
kubectl get secrets argocd-initial-admin-secret -o yaml -n argocd
```
5. Copy the password from the yaml and decode the base64 passcode - copy output
   ```
      echo "password" | base64 -d
   ```
6. start argo:
```
kubectl port-forward svc/argocd-server -n argocd 8080:80
```
7. manually apply application to view in argo:
```
kubectl apply -f example1/application.yaml
```
8. Go into argo and sync the deployment. 
Now look in k8s to see if the pods exist
```
kubectl get pods -n prod
``