class Doctor{
   String nomeCompleto;
   String email;
   String senha;
   String telefone;
   String especialidade;
   String genero;
   String endereco ;
   String tipo_Usuario;

   Doctor({this.nomeCompleto,this.email,this.senha,this.telefone,this.especialidade,this.endereco,this.genero, this.tipo_Usuario});

   factory Doctor.jsonFormato(Map<String , dynamic> maps){
       return Doctor(
           genero: maps['genero'],
           email: maps['email'],
           senha: maps['senha'],
           endereco: maps['endereco'],
           especialidade: maps['especialidade'],
           nomeCompleto: maps['nomeCompleto'],
           telefone: maps['telefone'],
           tipo_Usuario: maps['tipo_Usuario']
       );
   }

   Map<String , dynamic> toMapDoctor(){
      return {
         "genero":this.genero,
         "email":this.email,
         "senha":this.senha,
         "endereco":this.endereco,
         "especialidade":this.especialidade,
         "nomeCompleto":this.nomeCompleto,
         "telefone":this.telefone,
         "tipo_Usuario":this.tipo_Usuario
      } ;
   }

}