import 'package:flutter/material.dart';

class SearchHelper {
  String _noResult = "Busque por um usuário.";
  String _verifyConection = "Verifique sua conexão.";

  Widget noResult(){
    return Center(
      child: Text(
        _noResult,
        style: TextStyle(
            fontSize: 20
        ),
      ),
    );
  }

  Widget dataFail(String error){
    return Center(
      child: Text(
        error,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Widget verifyConnection(){
    return Center(
      child: Text(
        _verifyConection,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}