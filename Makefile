.PHONY: operator
operator:
	kubectl apply -f ./nats-operator-deploy
.PHONY: stream
stream:
	kubectl apply -f ./nats-streaming-deploy
.PHONY: natstan
natstan:
	kubectl apply -f ./nats-stan-deploy
.PHONY: app
	kubectl apply -f ./app-deploy
.PHONY: deploy
deploy:
	make operator
	make stream
	make natstan
	make app
	#kubectl get all


.PHONY: cleanup-natstan
cleanup-natstan:
	kubectl delete -f ./nats-stan-deploy 
.PHONY: cleanup-example2
cleanup-app:
	kubectl delete -f ./app-deploy

.PHONY: cleanup-stream
cleanup-stream:
	kubectl delete -f ./nats-streaming-deploy
.PHONY: cleanup-operator
cleanup-operator:
	kubectl delete -f ./nats-operator-deploy
.PHONY: cleanup
cleanup:
	make cleanup-natstan
	make cleanup-app
	make cleanup-stream
	make cleanup-operator
	kubectl get all

