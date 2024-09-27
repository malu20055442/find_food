
import 'package:flutter/material.dart';
import 'package:flutter_controle_scroll/models/restaurantes.dart';
import 'package:flutter_controle_scroll/repositories/restaurantes_repository.dart';

class detalhes extends StatefullWidget {
  detalhes ({Key? key}) : super (key: key);

  @override
_detalhesState createState() => _detalhesState();
}

class _detalhesState extends State<detalhes> {
  final List<GlobalKey> categorias = [GlobalKey(), GlobalKey(), GlobalKey()];
  late ScrollController scrollCont;
  BuildContext? tabContext;

  @override
void initState() {
 scrollCont = ScrollController();
 scrollCont = add.Listener(changeTabs);
 super.initState();
 }  
  changeTabs() {

    late RenderBox box;

    for (var i = 0; i < categorias.length; i++) {
     box = categorias [i].currentContext!.findRenderObject() as RenderBox;
     Offset position = box.localToGlobal(Offset.zero);

     if (scrollCont.offset >= positions.dy)
      DefaulftTabController.of(tabContext!)!.animateTo(i, duration: Durations(milliseconds: 100),);
    }
  }

  scrollTo(int index) async {
    scrollCont.removeListener(changeTabs);
    final categoria = categorias[index].currentContext!;
    await Scrollable.ensureVisible(categoria, duration: Duration(microseconds: 600),);
    ScrollCont.addListener(changeTabs);
  }

  @override
Widget build(BuildContext context) {
  return DefaultTabController(
    length: 3, 
    child: Builder(builder: BuildContext context){
    tabContext = context;
    return Scaffold(
      appBar: AppBar(leading: BackButton(color: Colors.blue),
      actions: [
        IconButton(
        onPressed: () {},
        icon: Icon(Icons.search, color: Colors.blue)
        )  
      botton: TabBar(
      tabs:[
        tab(child: Text('restaurantes')),
        tab(child: Text('descrição')),
        tab(child: Text('sugestões')),],
      onTap: (int index) => scrollTo(index),
      ),
      ]
      ),
      body: SingleChildScrollView(
        controller: sceollCont,
        child: Column(
         children: [
          categoriaLugar('restaurantes', 0),
          gerarListaTreco(restaurante_repository.restaurante),
          categoriaLugar('descrição', 1),
          gerarListaTreco(restaurante_repository.descricao),
          categoriaLugar('sugestões', 2),
          gerarListaTreco(restaurante_repository.sugestoes),
      ],
     ),
    ),
   ),
  );
 } 
}

gerarListaTreco(List<Treco>lugar) {
  return Column(
    children: [
      ListTile(
        title: Text(lugar.nome),
        subtile: Padding(
          padding: EdgetINsets.only(top:12.0),
          child: Column(
            crossAligment: CrossAxisAligment.start,
            children:[
              Text(
                lugar.descricao,
                style: TextStyle(fontSize: 13),
              ),
              Padding(
                padding:EdgeInsets.only(top:24),
                child: Text(
                  lugar.preco,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                )
              )
            ]
          ) 
        ),
        trailing: Image.network(lugar.imagem),
        contentPadding: EdgeInsets.all(15),
      )
      Divider(),
    ]
  )
}

Widget categoriaLugar(String Titulo, int index) {
  return Padding(
    key: categorias[index],
    padding: EdgeInsets.only(top:24),
    child: column(
      children: [
        ListTitle(
          title: Text(
           titulo,
           style: TextStyle(fontSize:18, fontWeight: FonWeight.w600),
          )
        ),
        Divider(),
      ]
    )
  )

}
