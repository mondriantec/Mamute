for i in app/views/*;
do
  sed -i .bkp 's/Editing/Editar/g' $i/*.erb
  sed -i .bkp 's/Edit/Editar/g' $i/*.erb
  sed -i .bkp 's/Editarar/Editar/g' $i/*.erb
  sed -i .bkp 's/New/Novo/g' $i/*.erb
  sed -i .bkp 's/Destroy/Apagar/g' $i/*.erb
  sed -i .bkp 's/Listing/Cadastro de/g' $i/index.html.erb
  sed -i .bkp 's/Back/Voltar/g' $i/*.erb
  sed -i .bkp 's/Show/Visualizar/g' $i/*.erb
  sed -i .bkp 's/Update/Salvar/g' $i/*.erb
  sed -i .bkp 's/Create/Salvar/g' $i/*.erb  
  sed -i .bkp 's/Are you sure/Tem certeza/g' $i/*.erb

done;
