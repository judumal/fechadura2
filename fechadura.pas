//Elton Antonio Batista dos Santos - 2220112
//Juliana Prestupa - 1610282
//Matheus Fabricio Machado de Oliveira - 2220756

Program fechadura;

const
MAX = 4;

type
	dados = record
	nome, sobrenome, senha: string;
	cpf: string;
end;

var
v:array[0..MAX] of dados;
i,j,sair,CountCadastro,CountLogin: integer;
confSenha,confCPF,cpf:string;

procedure visualizar;
begin
writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeLN('=-=-=-=-=-=-=-= CADASTROS =-=-=-=-=-=-=-=');
writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
for i:= 0 to MAX do
	begin
		writeln();
		write(' | ');
		write(v[i].nome,' ');
		write(v[i].sobrenome,' ');
		write(v[i].cpf,' ');
		write(v[i].senha,' ');
		write(' | ');
	end;
	delay(3000);
	clrscr;
end;	

procedure cadastro;
	begin
	CountCadastro := 0;
	for i:=0 to MAX do
		begin
		  clrscr;
			writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
			writeLN('=-=-=-=-=- CADASTRO DO USUÁRIO -=-=-=-=-=');
			writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
			if (v[i].nome = '') then
			begin
				write('Qual seu nome? ');
				readln(v[i].nome);
				write('Qual seu sobrenome? ');
				readln(v[i].sobrenome);
				write('Qual seu CPF? ');
				readln(v[i].cpf);
				write('Qual sua senha? ');
				readln(v[i].senha);	
				delay(1500);
				write('Cadastro realizado.');
				delay(1500);
				clrscr;				
			end			
			else
			begin
				CountCadastro := CountCadastro + 1;
				 if (CountCadastro = MAX) then
				 	begin
				 		clrscr;
				 		write('Limite de cadastros atingidos.');
				 		delay(3000);				 		
				 	end;
			end;
				clrscr;	 			    		
		end;
	end;
		
	
procedure alteracao;
  begin
  	writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
		writeLN('=-=-=-=-=- ALTERAÇÃO DE SENHA -=-=-=-=-=-');
		writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
		writeln('Qual seu CPF? ');
		read(cpf);
			begin
				for i:=0 to MAX do 
				begin
					if (cpf = v[i].cpf) then
					begin
						writeln('Digite sua nova senha: ');
						read(v[i].senha);
						delay(1000);
						writeln('Senha alterada com SUCESSO!');
						delay(1000);
						clrscr;
						break;
					end;
				end;	
			end;
	end;
		
procedure exclusao;
var
	confirmacao:char;

	begin
		writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
		writeLN('=-=-=-=-=- EXCLUSÃO DE USUÁRIO -=-=-=-=-=');
		writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
		writeln('Qual seu CPF? ');
		read(cpf);
		delay(2000);
			begin
			for i:=0 to MAX do 
			begin
				if (cpf = v[i].cpf) then
				begin
					writeln('Deseja confirmar a exclusão do usuario ',v[i].nome,' ? S/N');
					read(confirmacao);
						if(confirmacao='S') then
							v[i].nome:='';
							v[i].sobrenome:='';
							v[i].cpf:='0';
							v[i].senha:='';
							delay(1000);
							writeln('USUÁRIO EXCLUIDO COM SUCESSO!');
							delay(2000);
							clrscr;
						break;
					end;
				end;
			end;	
	end;

function login(j:string;k:string):boolean;

	begin
			
			for i:=0 to MAX do
			
			begin
				if (j = v[i].cpf) and (k = v[i].senha) then
				begin
					login:= True;
					
					break;
				end;
			login:= False;
			     
			end;
		
	end;
	
procedure menu;
var
menu: char;
	begin
		writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
		writeln('-=-=-=-= DIGITE A OPÇÃO DESEJADA =-=-=-=-');
		writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
		writeln('=-=-=-=-=-=  C - CADASTRO  =-=-=-=-=-=-=-');
		writeln('=-=-=-=-=-=  A - ALTERAÇÃO  =-=-=-=-=-=-=');
		writeln('=-=-=-=-=-=  E - EXCLUSÃO  =-=-=-=-=-=-=-');
		writeln('=-=-=-=-=-=  L - LOGIN  =-=-=-=-=-=-=-=-=');
		writeln('=-=-=-=-=-=  V - VISUALIZAR  =-=-=-=-=-=-');
		writeln('=-=-=-=-=-=  S - SAIR  =-=-=-=-=-=-=-=-=-');
		writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
		writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
		read(menu);
		
		clrscr;		
			case menu of
				'C': cadastro;
				'A': alteracao;
				'E': exclusao;
				'S': sair:=1;
				'V': visualizar;
				'L': begin
							writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
							for j:=1 to 3 do
								begin
									
									write('Digite seu CPF: ');
									readln(confCPF);
									write('Digite sua senha: ');
									readln(confSenha);
									
									if (login(confCPF,confSenha) = True) then
										begin	
										delay(1500);
										writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
										writeln('=-=-=-=-=-=- Acesso permitido -=-=-=-=-=-');
										writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
										delay(1500);
												
										clrscr;	
																			
										break;
										end
									else
										begin 
										if (j = 3) then
											begin
												delay(1500);
												writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
												writeln('=-=-=-=-=-=- Limite de tentativas excedido, tente novamente mais tarde. -=-=-=-=-=-');
												writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
												delay(1500); 
												clrscr;		 
											end
										else
											begin											
												delay(1500);
												writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-');
												writeln('=-=-=-=-=-=- Acesso não permitido, tente novamente. -=-=-=-=-=-');
												writeln('=-=-=-=-=-=- Tentativas disponíveis ',3-j,' =-=-=-=-=-=-=-=-=-=');
												delay(3000);
												clrscr;
											end;									  						
										end;		
								 clrscr;
							end;			
					end;
			end;
	end;
		
Begin
writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln('=-=-=-=-=-=-=-= BEM VINDO =-=-=-=-=-=-=-=');
writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
delay(2000);
clrscr;
while(sair<1) do
	begin
		menu;
	end;
	writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
	writeln('=-=-=-=-=-=-= VOLTE SEMPRE! =-=-=-=-=-=-=');
	writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');  
End.