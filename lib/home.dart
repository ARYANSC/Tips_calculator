import 'package:flutter/material.dart';

class BillSplitter extends StatefulWidget {
  const BillSplitter({super.key});

  @override
  State<BillSplitter> createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  double _billAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tips Calculator" , style: TextStyle(
          color: Colors.purple,
        ),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.purpleAccent.shade100,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  <Widget>[
                    const Text("Total tip to give" , style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),),
                    Text("\Rs ${calculateTotalTip(_billAmount, _tipPercentage)}" ,style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                border: Border.all(
                  color: Colors.blueGrey.shade100,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(12.0)
              ),

              child: Column(
                children:  <Widget>[
                  TextField(
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    style:const TextStyle(color: Colors.purple),
                    decoration: const InputDecoration(
                      prefixText: "Bill Amount : ",
                      prefixIcon: Icon(Icons.currency_rupee_outlined),
                    ),
                    onChanged: (String value){
                      try{
                        _billAmount= double.parse(value);
                    }catch(exception){
                        _billAmount  = 0.0;
                      }
                    },
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  <Widget>[
                      Text("             Set Tip Percentage please !!",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15,
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 20,),
                  Column(
                    children: <Widget>[
                      Text("$_tipPercentage%",style: const TextStyle(color: Colors.purple,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),),
                      Slider(
                          min:0,
                          max: 100,
                          activeColor: Colors.purple,
                          inactiveColor: Colors.grey,
                          divisions: 20,
                          value: _tipPercentage.toDouble(), onChanged: (double newValue){
                        setState(() {
                          _tipPercentage = newValue.round();
                        });
                      })
                    ],
                  )
                ],
              ),

            ),

          ],
        ),
      ),
    );
  }
  calculateTotalTip(double billAmount , int tipPercentage) {
    double totalTip = 0.0;
    if(billAmount<0 || billAmount.toString().isEmpty || billAmount == null){

    }else{
      totalTip = ((billAmount)/100)*tipPercentage;
    }
    return totalTip;
  }
}