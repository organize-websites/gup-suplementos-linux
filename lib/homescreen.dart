import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_icons/flutter_icons.dart';


void main() {runApp(MaterialApp(
	title: 'Navegação Básica',
	 theme: ThemeData(
	   primarySwatch: Colors.blue[900],
         ),
         home: HomePage(),
      )
    );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gup! Suplementos',
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: 
        AppBar(
          title: 
          Center(
            child: Text('Gup! Suplementos'),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Carrinho()));
                        },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Pesquise()));
                        },
            ),
          ],
          backgroundColor: Color.fromRGBO(1, 9, 115, 1.0),
        ),
        body:
        WebView(
          initialUrl: 'https://gupsuplementos.com.br/home-app/',
          javascriptMode: JavascriptMode.unrestricted,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: FlatButton(
                    child: Image.asset('imagens/logo-gup.png'),
                    onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                    color: Colors.transparent,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Acessar()));
                        }, 
                child: Text('Ainda não acessou? Clique aqui para entrar!')
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('HOME'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
              ),              
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('SOBRE NÓS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text('CONTATE-NOS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Contato()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.map),
                title: Text('ENCONTRE-NOS'),
                onTap: _launchURL4,
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('FAÇA SEU PEDIDO'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FacaSeuPedido()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.shopping_basket),
                title: Text('CARRINHO'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Carrinho()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text('ACESSAR'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Acessar()));
                },
              ),
              ListTile(
                leading: Icon(Icons.supervisor_account),
                title: Text('MINHA CONTA'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MinhaConta()));
                },
              ),
              ListTile(
                leading: Icon(Icons.copyright),
                title: Text('SOBRE O APP'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SobreOApp()));
                        },
              ),
              ListTile(
                leading: Icon(FontAwesome.whatsapp),
                title: Text('WHATSAPP'),
                onTap: _launchURL,
              ),
              ListTile(
                leading: Icon(FontAwesome.facebook),
                title: Text('FACEBOOK'),
                onTap: _launchURL2,
              ),
              ListTile(
                leading: Icon(FontAwesome.instagram),
                title: Text('INSTAGRAM'),
                onTap: _launchURL3,
              ),
              ListTile(
                leading: Icon(Icons.public),
                title: Text('POLÍTICA DE PRIVACIDADE'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PoliticaDePrivacidade()));
                        },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Pesquise extends StatefulWidget {
  @override
  _PesquiseState createState() => _PesquiseState();
}

class _PesquiseState extends State<Pesquise> {
  bool isLoading = false;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override

      void initState() {
        setState(() {
          isLoading = true;
        });
        super.initState();
      }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(
          title: 
          Center(
            child: Text('Gup! Suplementos'),
          ),
          actions: <Widget>[
            NavigationControls(_controller.future),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Carrinho()));
                        },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Pesquise()));
                        },
            ),
          ],
          backgroundColor: Color.fromRGBO(1, 9, 115, 1.0),
        ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'https://gupsuplementos.com.br/pesquise-app/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
         );
         
      }),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: FlatButton(
                    child: Image.asset('imagens/logo-gup.png'),
                    onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                    color: Colors.transparent,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Acessar()));
                        }, 
                child: Text('Ainda não acessou? Clique aqui para entrar!')
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('HOME'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
              ),              
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('SOBRE NÓS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text('CONTATE-NOS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Contato()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.map),
                title: Text('ENCONTRE-NOS'),
                onTap: _launchURL4,
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('FAÇA SEU PEDIDO'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FacaSeuPedido()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.shopping_basket),
                title: Text('CARRINHO'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Carrinho()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text('ACESSAR'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Acessar()));
                },
              ),
              ListTile(
                leading: Icon(Icons.supervisor_account),
                title: Text('MINHA CONTA'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MinhaConta()));
                },
              ),
              ListTile(
                leading: Icon(Icons.copyright),
                title: Text('SOBRE O APP'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SobreOApp()));
                        },
              ),
              ListTile(
                leading: Icon(FontAwesome.whatsapp),
                title: Text('WHATSAPP'),
                onTap: _launchURL,
              ),
              ListTile(
                leading: Icon(FontAwesome.facebook),
                title: Text('FACEBOOK'),
                onTap: _launchURL2,
              ),
              ListTile(
                leading: Icon(FontAwesome.instagram),
                title: Text('INSTAGRAM'),
                onTap: _launchURL3,
              ),
              ListTile(
                leading: Icon(Icons.public),
                title: Text('POLÍTICA DE PRIVACIDADE'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PoliticaDePrivacidade()));
                        },
              ),
            ],
          ),
        ),  
    );
  }
}


class Sobre extends StatefulWidget {
  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  bool isLoading = false;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override

      void initState() {
        setState(() {
          isLoading = true;
        });
        super.initState();
      }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(
          title: 
          Center(
            child: Text('Gup! Suplementos'),
          ),
          actions: <Widget>[
            NavigationControls(_controller.future),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Carrinho()));
                        },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Pesquise()));
                        },
            ),
          ],
          backgroundColor: Color.fromRGBO(1, 9, 115, 1.0),
        ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'https://gupsuplementos.com.br/sobre-app/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
         );
         
      }),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: FlatButton(
                    child: Image.asset('imagens/logo-gup.png'),
                    onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                    color: Colors.transparent,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Acessar()));
                        }, 
                child: Text('Ainda não acessou? Clique aqui para entrar!')
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('HOME'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
              ),              
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('SOBRE NÓS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text('CONTATE-NOS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Contato()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.map),
                title: Text('ENCONTRE-NOS'),
                onTap: _launchURL4,
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('FAÇA SEU PEDIDO'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FacaSeuPedido()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.shopping_basket),
                title: Text('CARRINHO'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Carrinho()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text('ACESSAR'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Acessar()));
                },
              ),
              ListTile(
                leading: Icon(Icons.supervisor_account),
                title: Text('MINHA CONTA'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MinhaConta()));
                },
              ),
              ListTile(
                leading: Icon(Icons.copyright),
                title: Text('SOBRE O APP'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SobreOApp()));
                        },
              ),
              ListTile(
                leading: Icon(FontAwesome.whatsapp),
                title: Text('WHATSAPP'),
                onTap: _launchURL,
              ),
              ListTile(
                leading: Icon(FontAwesome.facebook),
                title: Text('FACEBOOK'),
                onTap: _launchURL2,
              ),
              ListTile(
                leading: Icon(FontAwesome.instagram),
                title: Text('INSTAGRAM'),
                onTap: _launchURL3,
              ),
              ListTile(
                leading: Icon(Icons.public),
                title: Text('POLÍTICA DE PRIVACIDADE'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PoliticaDePrivacidade()));
                        },
              ),
            ],
          ),
        ),  
    );
  }
}

class Contato extends StatefulWidget {
  @override
  _ContatoState createState() => _ContatoState();
}

class _ContatoState extends State<Contato> {
  bool isLoading = false;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override

      void initState() {
        setState(() {
          isLoading = true;
        });
        super.initState();
      }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(
          title: 
          Center(
            child: Text('Gup! Suplementos'),
          ),
          actions: <Widget>[
            NavigationControls(_controller.future),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Carrinho()));
                        },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Pesquise()));
                        },
            ),
          ],
          backgroundColor: Color.fromRGBO(1, 9, 115, 1.0),
        ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'https://gupsuplementos.com.br/contato-app/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
         );
         
      }),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: FlatButton(
                    child: Image.asset('imagens/logo-gup.png'),
                    onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                    color: Colors.transparent,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Acessar()));
                        }, 
                child: Text('Ainda não acessou? Clique aqui para entrar!')
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('HOME'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
              ),              
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('SOBRE NÓS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text('CONTATE-NOS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Contato()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.map),
                title: Text('ENCONTRE-NOS'),
                onTap: _launchURL4,
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('FAÇA SEU PEDIDO'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FacaSeuPedido()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.shopping_basket),
                title: Text('CARRINHO'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Carrinho()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text('ACESSAR'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Acessar()));
                },
              ),
              ListTile(
                leading: Icon(Icons.supervisor_account),
                title: Text('MINHA CONTA'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MinhaConta()));
                },
              ),
              ListTile(
                leading: Icon(Icons.copyright),
                title: Text('SOBRE O APP'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SobreOApp()));
                        },
              ),
              ListTile(
                leading: Icon(FontAwesome.whatsapp),
                title: Text('WHATSAPP'),
                onTap: _launchURL,
              ),
              ListTile(
                leading: Icon(FontAwesome.facebook),
                title: Text('FACEBOOK'),
                onTap: _launchURL2,
              ),
              ListTile(
                leading: Icon(FontAwesome.instagram),
                title: Text('INSTAGRAM'),
                onTap: _launchURL3,
              ),
              ListTile(
                leading: Icon(Icons.public),
                title: Text('POLÍTICA DE PRIVACIDADE'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PoliticaDePrivacidade()));
                        },
              ),
            ],
          ),
        ),  
    );
  }
}

class SobreOApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gup! Suplementos',
      theme: ThemeData.light(),
      home: Scaffold(
      appBar: 
        AppBar(
          title: 
          Center(
            child: Text('Gup! Suplementos'),
          ),
            backgroundColor: Color.fromRGBO(1, 9, 115, 1.0),
        ),
      body: 
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(68.0),
              child: Image.asset('imagens/logo-gup.png'),
            ),
            Text('Gup! Suplementos'),
            Text('Criado pela Organize Websites!'),
            Text('Versão 1.0.1'),
            Image.asset('imagens/logo_p.png')
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: FlatButton(
                    child: Image.asset('imagens/logo-gup.png'),
                    onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                    color: Colors.transparent,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('HOME'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('SOBRE NÓS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text('CONTATE-NOS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Contato()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.map),
                title: Text('ENCONTRE-NOS'),
                onTap: _launchURL4,
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('FAÇA SEU PEDIDO'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FacaSeuPedido()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.shopping_basket),
                title: Text('CARRINHO'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Carrinho()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text('ACESSAR'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Acessar()));
                },
              ),
              ListTile(
                leading: Icon(Icons.supervisor_account),
                title: Text('MINHA CONTA'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MinhaConta()));
                },
              ),
              ListTile(
                leading: Icon(Icons.copyright),
                title: Text('SOBRE O APP'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SobreOApp()));
                        },
              ),
              ListTile(
                leading: Icon(FontAwesome.whatsapp),
                title: Text('WHATSAPP'),
                onTap: _launchURL,
              ),
              ListTile(
                leading: Icon(FontAwesome.facebook),
                title: Text('FACEBOOK'),
                onTap: _launchURL2,
              ),
              ListTile(
                leading: Icon(FontAwesome.instagram),
                title: Text('INSTAGRAM'),
                onTap: _launchURL3,
              ),
              ListTile(
                leading: Icon(Icons.public),
                title: Text('POLÍTICA DE PRIVACIDADE'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PoliticaDePrivacidade()));
                        },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FacaSeuPedido extends StatefulWidget {
  @override
  _FacaSeuPedidoState createState() => _FacaSeuPedidoState();
}

class _FacaSeuPedidoState extends State<FacaSeuPedido> {
  bool isLoading = false;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override

      void initState() {
        setState(() {
          isLoading = true;
        });
        super.initState();
      }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(
          title: 
          Center(
            child: Text('Gup! Suplementos'),
          ),
          actions: <Widget>[
            NavigationControls(_controller.future),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Carrinho()));
                        },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Pesquise()));
                        },
            ),
          ],
          backgroundColor: Color.fromRGBO(1, 9, 115, 1.0),
        ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'https://gupsuplementos.com.br/produtos-app/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
         );
         
      }),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: FlatButton(
                    child: Image.asset('imagens/logo-gup.png'),
                    onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                    color: Colors.transparent,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Acessar()));
                        }, 
                child: Text('Ainda não acessou? Clique aqui para entrar!')
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('HOME'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
              ),              
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('SOBRE NÓS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text('CONTATE-NOS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Contato()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.map),
                title: Text('ENCONTRE-NOS'),
                onTap: _launchURL4,
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('FAÇA SEU PEDIDO'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FacaSeuPedido()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.shopping_basket),
                title: Text('CARRINHO'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Carrinho()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text('ACESSAR'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Acessar()));
                },
              ),
              ListTile(
                leading: Icon(Icons.supervisor_account),
                title: Text('MINHA CONTA'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MinhaConta()));
                },
              ),
              ListTile(
                leading: Icon(Icons.copyright),
                title: Text('SOBRE O APP'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SobreOApp()));
                        },
              ),
              ListTile(
                leading: Icon(FontAwesome.whatsapp),
                title: Text('WHATSAPP'),
                onTap: _launchURL,
              ),
              ListTile(
                leading: Icon(FontAwesome.facebook),
                title: Text('FACEBOOK'),
                onTap: _launchURL2,
              ),
              ListTile(
                leading: Icon(FontAwesome.instagram),
                title: Text('INSTAGRAM'),
                onTap: _launchURL3,
              ),
              ListTile(
                leading: Icon(Icons.public),
                title: Text('POLÍTICA DE PRIVACIDADE'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PoliticaDePrivacidade()));
                        },
              ),
            ],
          ),
        ),  
    );
  }
}

class Acessar extends StatefulWidget {
  @override
  _AcessarState createState() => _AcessarState();
}

class _AcessarState extends State<Acessar> {
  bool isLoading = false;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override

      void initState() {
        setState(() {
          isLoading = true;
        });
        super.initState();
      }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(
          title: 
          Center(
            child: Text('Gup! Suplementos'),
          ),
          actions: <Widget>[
            NavigationControls(_controller.future),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Carrinho()));
                        },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Pesquise()));
                        },
            ),
          ],
          backgroundColor: Color.fromRGBO(1, 9, 115, 1.0),
        ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'https://gupsuplementos.com.br/wp-admin/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
         );
         
      }),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: FlatButton(
                    child: Image.asset('imagens/logo-gup.png'),
                    onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                    color: Colors.transparent,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Acessar()));
                        }, 
                child: Text('Ainda não acessou? Clique aqui para entrar!')
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('HOME'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
              ),              
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('SOBRE NÓS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text('CONTATE-NOS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Contato()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.map),
                title: Text('ENCONTRE-NOS'),
                onTap: _launchURL4,
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('FAÇA SEU PEDIDO'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FacaSeuPedido()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.shopping_basket),
                title: Text('CARRINHO'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Carrinho()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text('ACESSAR'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Acessar()));
                },
              ),
              ListTile(
                leading: Icon(Icons.supervisor_account),
                title: Text('MINHA CONTA'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MinhaConta()));
                },
              ),
              ListTile(
                leading: Icon(Icons.copyright),
                title: Text('SOBRE O APP'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SobreOApp()));
                        },
              ),
              ListTile(
                leading: Icon(FontAwesome.whatsapp),
                title: Text('WHATSAPP'),
                onTap: _launchURL,
              ),
              ListTile(
                leading: Icon(FontAwesome.facebook),
                title: Text('FACEBOOK'),
                onTap: _launchURL2,
              ),
              ListTile(
                leading: Icon(FontAwesome.instagram),
                title: Text('INSTAGRAM'),
                onTap: _launchURL3,
              ),
              ListTile(
                leading: Icon(Icons.public),
                title: Text('POLÍTICA DE PRIVACIDADE'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PoliticaDePrivacidade()));
                        },
              ),
            ],
          ),
        ),  
    );
  }
}

class PoliticaDePrivacidade extends StatefulWidget {
  @override
  _PoliticaDePrivacidadeState createState() => _PoliticaDePrivacidadeState();
}

class _PoliticaDePrivacidadeState extends State<PoliticaDePrivacidade> {
  bool isLoading = false;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override

      void initState() {
        setState(() {
          isLoading = true;
        });
        super.initState();
      }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(
          title: 
          Center(
            child: Text('Gup! Suplementos'),
          ),
          actions: <Widget>[
            NavigationControls(_controller.future),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Carrinho()));
                        },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Pesquise()));
                        },
            ),
          ],
          backgroundColor: Color.fromRGBO(1, 9, 115, 1.0),
        ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'https://gupsuplementos.com.br/politica-de-privacidade-app',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
         );
         
      }),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: FlatButton(
                    child: Image.asset('imagens/logo-gup.png'),
                    onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                    color: Colors.transparent,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Acessar()));
                        }, 
                child: Text('Ainda não acessou? Clique aqui para entrar!')
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('HOME'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
              ),              
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('SOBRE NÓS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text('CONTATE-NOS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Contato()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.map),
                title: Text('ENCONTRE-NOS'),
                onTap: _launchURL4,
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('FAÇA SEU PEDIDO'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FacaSeuPedido()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.shopping_basket),
                title: Text('CARRINHO'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Carrinho()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text('ACESSAR'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Acessar()));
                },
              ),
              ListTile(
                leading: Icon(Icons.supervisor_account),
                title: Text('MINHA CONTA'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MinhaConta()));
                },
              ),
              ListTile(
                leading: Icon(Icons.copyright),
                title: Text('SOBRE O APP'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SobreOApp()));
                        },
              ),
              ListTile(
                leading: Icon(FontAwesome.whatsapp),
                title: Text('WHATSAPP'),
                onTap: _launchURL,
              ),
              ListTile(
                leading: Icon(FontAwesome.facebook),
                title: Text('FACEBOOK'),
                onTap: _launchURL2,
              ),
              ListTile(
                leading: Icon(FontAwesome.instagram),
                title: Text('INSTAGRAM'),
                onTap: _launchURL3,
              ),
              ListTile(
                leading: Icon(Icons.public),
                title: Text('POLÍTICA DE PRIVACIDADE'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PoliticaDePrivacidade()));
                        },
              ),
            ],
          ),
        ),  
    );
  }
}

class MinhaConta extends StatefulWidget {
  @override
  _MinhaContaState createState() => _MinhaContaState();
}

class _MinhaContaState extends State<MinhaConta> {
  bool isLoading = false;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override

      void initState() {
        setState(() {
          isLoading = true;
        });
        super.initState();
      }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(
          title: 
          Center(
            child: Text('Gup! Suplementos'),
          ),
          actions: <Widget>[
            NavigationControls(_controller.future),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Carrinho()));
                        },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Pesquise()));
                        },
            ),
          ],
          backgroundColor: Color.fromRGBO(1, 9, 115, 1.0),
        ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'https://gupsuplementos.com.br/minha-conta-app/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
         );
         
      }),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: FlatButton(
                    child: Image.asset('imagens/logo-gup.png'),
                    onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                    color: Colors.transparent,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Acessar()));
                        }, 
                child: Text('Ainda não acessou? Clique aqui para entrar!')
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('HOME'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
              ),              
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('SOBRE NÓS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text('CONTATE-NOS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Contato()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.map),
                title: Text('ENCONTRE-NOS'),
                onTap: _launchURL4,
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('FAÇA SEU PEDIDO'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FacaSeuPedido()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.shopping_basket),
                title: Text('CARRINHO'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Carrinho()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text('ACESSAR'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Acessar()));
                },
              ),
              ListTile(
                leading: Icon(Icons.supervisor_account),
                title: Text('MINHA CONTA'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MinhaConta()));
                },
              ),
              ListTile(
                leading: Icon(Icons.copyright),
                title: Text('SOBRE O APP'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SobreOApp()));
                        },
              ),
              ListTile(
                leading: Icon(FontAwesome.whatsapp),
                title: Text('WHATSAPP'),
                onTap: _launchURL,
              ),
              ListTile(
                leading: Icon(FontAwesome.facebook),
                title: Text('FACEBOOK'),
                onTap: _launchURL2,
              ),
              ListTile(
                leading: Icon(FontAwesome.instagram),
                title: Text('INSTAGRAM'),
                onTap: _launchURL3,
              ),
              ListTile(
                leading: Icon(Icons.public),
                title: Text('POLÍTICA DE PRIVACIDADE'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PoliticaDePrivacidade()));
                        },
              ),
            ],
          ),
        ),  
    );
  }
}

class Carrinho extends StatefulWidget {
  @override
  _CarrinhoState createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  bool isLoading = false;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override

      void initState() {
        setState(() {
          isLoading = true;
        });
        super.initState();
      }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(
          title: 
          Center(
            child: Text('Gup! Suplementos'),
          ),
          actions: <Widget>[
            NavigationControls(_controller.future),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Carrinho()));
                        },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Pesquise()));
                        },
            ),
          ],
          backgroundColor: Color.fromRGBO(1, 9, 115, 1.0),
        ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'https://gupsuplementos.com.br/carrinho-app/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
         );
         
      }),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: FlatButton(
                    child: Image.asset('imagens/logo-gup.png'),
                    onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                    color: Colors.transparent,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Acessar()));
                        }, 
                child: Text('Ainda não acessou? Clique aqui para entrar!')
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('HOME'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
              ),              
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('SOBRE NÓS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text('CONTATE-NOS'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Contato()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.map),
                title: Text('ENCONTRE-NOS'),
                onTap: _launchURL4,
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('FAÇA SEU PEDIDO'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FacaSeuPedido()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.shopping_basket),
                title: Text('CARRINHO'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Carrinho()));
                        },
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text('ACESSAR'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Acessar()));
                },
              ),
              ListTile(
                leading: Icon(Icons.supervisor_account),
                title: Text('MINHA CONTA'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MinhaConta()));
                },
              ),
              ListTile(
                leading: Icon(Icons.copyright),
                title: Text('SOBRE O APP'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SobreOApp()));
                        },
              ),
              ListTile(
                leading: Icon(FontAwesome.whatsapp),
                title: Text('WHATSAPP'),
                onTap: _launchURL,
              ),
              ListTile(
                leading: Icon(FontAwesome.facebook),
                title: Text('FACEBOOK'),
                onTap: _launchURL2,
              ),
              ListTile(
                leading: Icon(FontAwesome.instagram),
                title: Text('INSTAGRAM'),
                onTap: _launchURL3,
              ),
              ListTile(
                leading: Icon(Icons.public),
                title: Text('POLÍTICA DE PRIVACIDADE'),
                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PoliticaDePrivacidade()));
                        },
              ),
            ],
          ),
        ),  
    );
  }
}


_launchURL() async {
  const url = 'http://wa.me/553492547813&text=';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL2() async {
  const url = 'fb://page/10834492399768/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL3() async {
  const url = 'instagram://user?username=gupsuplementos';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL4() async {
  const url = 'https://www.google.com/maps/place/GUP+Suplementos/@-20.0382485,-47.7417289,17z/data=!3m1!4b1!4m5!3m4!1s0x94ba8d13f2182b33:0xf70054d9215055c6!8m2!3d-20.0382485!4d-47.7395402';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController controller = snapshot.data;
        return Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: !webViewReady
                  ? null
                  : () async {
                      if (await controller.canGoBack()) {
                        await controller.goBack();
                      } else {
                        Scaffold.of(context).showSnackBar(
                          const SnackBar(content: Text("No back history item")),
                        );
                        return;
                      }
                    },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: !webViewReady
                  ? null
                  : () async {
                      if (await controller.canGoForward()) {
                        await controller.goForward();
                      } else {
                        Scaffold.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("No forward history item")),
                        );
                        return;
                      }
                    },
            ),
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: !webViewReady
                  ? null
                  : () {
                      controller.reload();
                    },
            ),
          ],
        );
      },
    );
  }
}
