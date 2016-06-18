function [evecs,evals] = compute_pca(X)
newX = X';
mean_x = mean(newX);
size_x = size(newX,1);

for i = 1:size_x
 newX(i,:) = newX(i,:)-mean_x;
end

t_newX = newX';
[N,D]=size(newX);

if(N>D)
    S=(t_newX*newX)/N;
    [evecs,evals]=eig(S);
    [evals,I]=sort(diag(evals),'descend');
    evecs = evecs(:, I);
end

if(N<D)
    S=(newX*t_newX)/N;
    [evecs,evals]=eig(S);
    [evals,I]=sort(diag(evals),'descend');
    evecs = evecs(:, I);
    evecs=t_newX*evecs;
end

all_discorded = ones(D,1);
for i=1:D
    for j=i:D
        all_discorded(i) = all_discorded(i) + evals(j,:);
    end
end

subplot(1,5,1),axis image
imagesc(reshape(mean_x,28,28)')
subplot(1,5,2),axis image
imagesc(reshape(evecs(:,1),28,28)')
subplot(1,5,3),axis image
imagesc(reshape(evecs(:,2),28,28)')
subplot(1,5,4),axis image
imagesc(reshape(evecs(:,3),28,28)')
subplot(1,5,5),axis image
imagesc(reshape(evecs(:,4),28,28)')


 %subplot(1,2,1),axis image
 %plot(evals);
 %subplot(1,2,2),axis image
 %plot(all_discorded);


end