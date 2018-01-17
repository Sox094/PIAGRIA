// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//=require jquery-ui
//= require bootstrap-sprockets
//= require jquery_ujs
//=require toastr
//= require cocoon
//= require jquery_nested_form
//= require turbolinks
//= require_tree .

toastr.options = {
    "positionClass":"toast-bottom-right"
}

document.addEventListener("turbolinks:load", function() {
  $(document).ready(function(){
    $('#remove_question').click(function(){
    $('#bloc-questions input').prevAll("input[type=hidden]").first().val("1");
    $('#remove_question').closest("#bloc-questions").hide();
    
  });

  });
});



function remove_fields(link) {
  $(link).previous("input[type=hidden]").value = "1";
  $(link).up(".fields").hide();
}


function add_fields(link, association, content) { 
    var new_id = new Date().getTime(); 
    var regexp = new RegExp("new_" + association, "g"); 
    $(link).parent().before(content.replace(regexp, new_id));
    console.log("Ajout");
  
}
// FORM

<div class="panel panel-primary">
    <div class="panel-heading">
        Créer un formulaire
    </div>
    <div class="panel-body">
      <div class= "col-md-9">
        <div class="form-group">
          <%= form_for @formulaire do |f| %>
            <div class="row">
              <div class="form-group col-md-9">
                <%= f.label :name, "Nom du formulaire" %><br />
                <%= f.text_field :name, class: "form-control" %>
              </div>
            </div>
                  
            <div class="row">
              <div class="form-group col-md-9">
                <%= f.label :description, "Description du Formulaire" %><br />
                <%= f.text_area :description, class: "form-control" %>
              </div>
            </div>
            <br/><hr/><br/>
            <div class="col-md-1"></div>
              <div class="col-md-11"> 
                <div class="panel panel-success">
                  <div class="panel-heading">
                    Questions
                  </div>
                  <%= f.fields_for :questions, :child_index => "replace_this"  do |q| %>

                  <div id = "bloc-questions" class="panel-body">
                    
<!-- =========================================== Question_field ====================================================-->                 

  <div class= "questions">
    <div class = "question">
      <div class="fields">
        <%= q.hidden_field :_destroy %>
        <div class="field">
          <%= q.label :nom, "Question " %>
          <%= q.text_field :nom, placeholder: "Nom de la question", class: "form-control" %>
        </div>
        <div class = "field">
          <%= q.label :typequestion, "Type de la question" %>
          <%= q.select :typequestion, Question.typequestions.keys.map(&:humanize).zip(Question.typequestions
            .keys), placeholder: "Type", class: "form-control" %>
          <i class="fa fa-question-circle-o" title="Choix multiple : gngngngn - 
                   Choix simple : gngngn -
                   Réponse simple : gnngn"></i><br /> 
        </div>
            <span>
            <button type="button" class="btn btn-danger btn-sm" onclick>      
            <%= link_to "Supprimer la question", "javascript:void(0);", :id => "remove_question" %>
            </button>

          </span>
    </div>
  </div>
  </br>
</div>

<div id = "bloc-options" class="panel-body">
  <div class= "options">
    <div class = "option">
      <%= q.fields_for :answers do |b| %>
      
<!-- =========================================== Answer_field ====================================================--> 
  <%= b.text_field :content %>
  </br> </br>
  <%= b.hidden_field :_destroy %>
                    
<!-- =========================================== Answer_field ====================================================-->                 
                    
                 
      <% end %>
            <span>
            <button type="button" class="btn btn-info btn-sm" .onclick>
            <%= link_to "Ajouter une option", "javascript:void(0);", :id => "remove_option" %>
            </button>
            <button type="button" class="btn btn-warning btn-sm remove_option">Supprimer une option</button>
            </span>          
    </div>
  </div>

</div>

                    
<!-- =========================================== Question_field ====================================================-->                 
        
                  </div>
                  <% end %>
                </div>
              </div>
              <div class= "col-md-9">
              <button type="button" class="btn btn-info btn-sm add_question"><p>
                <%= link_to_add_fields "Add Question", f, :questions %></p>
              </button>
              </div>
            <div class="clearfix"></div></br></br>
              <div class="actions">
                    <%= f.submit "Valider le formulaire", class:"pull-right btn btn-primary" %>
              </div>
              
              
              
              
<!-- ======================================  JAVASCRIPT       ================================= !-->              
              <script>
    $(function(){
      $(".add_question").click(function(){
        
        // On récupère le nombre de questions créées dans le DOM
        index = $("#bloc-questions .question").length;
        // On récupère le nombre d'équipements affichés à l'utilisateur
        index2 = $("#bloc-questions .question").not(':hidden').length;
        //  (f.object retourne notre @formulaire)
        <% new_option = f.object.questions.build %>
         html = "<%= escape_javascript (f.fields_for(:questions, new_option, child_index: 'valeur_cherchee') { |q| }) %>"
        // On remplace valeur_cherchee2 par le numéro de la question 
        var regexp2 = new RegExp("valeur_cherchee2", "g");
        html = html.replace(regexp2, (index2 + 1));
        var regexp = new RegExp("valeur_cherchee", "g");
        html = html.replace(regexp, index);
         $("#bloc-questions").append(html);
        console.log("add question");
        return false;
      });
 
     
      
    });
  </script>
  
  <!-- ======================================  JAVASCRIPT       ================================= !-->              

  
                <% end %>
            </div>
        </div>
    </div>
</div>



//Index 

<div class="text-center">
    <h1> Bienvenue sur le générateur de formulaires d'Agria Grand Est  </h1>
</div>
<br/><br/>


<div class="col-md-3">
    <div class="panel panel-primary">
        <div class="panel-body" style="background-color:#D8D8D8"><center>
                        <div class="text-center-md"><%= link_to new_formulaire_path do %>Créer un formulaire
                        <br/>
                        <i class="fa fa-plus fa-5x"></i>
                        </div><% end %></center>
                        </br>
        </div>
    </div>   
</div>

<% @formulaires.each do |formulaire| %>
<div class="col-md-4">
    
    <div class="panel panel-primary">
        <div class="panel-heading">
         <%= formulaire.name %>
             <div class="text-right"> 
                Crée par <%= formulaire.user.prenom %> <%= formulaire.user.nom %> le <%= formulaire.updated_at.strftime("%d/%m/%Y")   %>
             </div>
     
     
        </div>
        
        <div class="panel-body">
            <div class= "col-md-12">
                <!--<div class="container">-->
                  <td><%= formulaire.description %></td>
                    </br>
                    <div class ="col-md-12 text-center"><hr/>
                    <table>
                    <td style="width=20px"><%= link_to '  Show ', formulaire , class: "fa fa-television"%></td>
                    <td style="padding-left: 10px"><%= link_to '  Edit', edit_formulaire_path(formulaire), class: "fa fa-pencil-square-o" %></td>
                    <td style="padding-left: 10px"><%= link_to '  Delete', formulaire, method: :delete, data: { confirm: 'Voulez-vous vraiment supprimer ce formulaire ?' }, class: "fa fa-trash-o" %> </td>
                    </table>
                    </div>
<!--                </div>    -->
            </div>
        </div>
    </div> 
    </br></br>
</div>
<div class="col-md-3">
</div>

<% end %>
<div class="clearfix"></div>
<div class="col-md-6 col-md-offset-5">
<%= will_paginate @formulaires %>
</br></br></br></br>
</div>