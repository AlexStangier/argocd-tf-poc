run 
    terraform apply ./argoWithTF/gke/                                                                    # creates a k8s cluster
    gcloud auth command from output
    helm repo add argo-cd https://argoproj.github.io/argo-helm
    helm dep update charts/argo-cd/
    helm install argo-cd ./argoWithHelm/charts/argo-cd/                                                  # deploys argo
    kubectl port-forward svc/argo-cd-argocd-server 8080:443                                              # makeshift ingress
    kubectl get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d            # get admin credentials
    helm template root-app/ | kubectl apply -f -                                                         # deploy all charts under ./root-app/templates/

    