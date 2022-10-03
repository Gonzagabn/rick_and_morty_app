import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty_app/main.dart' as app;

void main() async {
  testWidgets('Find characters page', (WidgetTester tester) async {
    // Artifício para tornar o processo visível pausando o processo por 5 seg.
    await Future.delayed(const Duration(seconds: 5));

    // Inicializa o app no emulador
    await app.main();

    // Aguarda todas as animações e construções da tela terminarem
    await tester.pumpAndSettle();

    // Encontra o botão através da "key" e faz um clique
    await tester.tap(find.byKey(const Key('characters_buton')).first);

    // Aguarda todas as animações e construções da tela terminarem
    await tester.pumpAndSettle();

    // Testa a condição que se deseja
    expect(find.byKey(const Key('characters_page')).first, findsOneWidget);

    // Aguarda todas as animações e construções da tela terminarem
    await tester.pumpAndSettle();

    // Encontra o botão através da "key" e faz um clique
    await tester.tap(find.byType(FadeInImage).first);

    // Aguarda todas as animações e construções da tela terminarem
    await tester.pumpAndSettle();

    // Encontra o botão através da "key" e faz um clique
    await tester.tap(find.byType(FadeInImage).first);

    // Aguarda todas as animações e construções da tela terminarem
    await tester.pumpAndSettle();

    // Encontra o botão através da "key" e faz um clique
    await tester.tap(find.byKey(const Key('back_page')).first);

    // Aguarda todas as animações e construções da tela terminarem
    await tester.pumpAndSettle();

    // Encontra o botão através da "key" e faz um clique
    await tester.tap(find.byKey(const Key('back_page')).first);

    // Aguarda todas as animações e construções da tela terminarem
    await tester.pumpAndSettle();

    // Encontra o botão através da "key" e faz um clique
    await tester.tap(find.byKey(const Key('favorites_buton')).first);

    // Aguarda todas as animações e construções da tela terminarem
    await tester.pumpAndSettle();

    // Testa a condição que se deseja
    expect(find.byKey(const Key('favorites_page')).first, findsOneWidget);

    // Aguarda todas as animações e construções da tela terminarem
    await tester.pumpAndSettle();

    // Testa a condição que se deseja
    expect(find.byType(GestureDetector), findsWidgets);

    // Artifício para tornar o processo visível pausando o processo por 2 seg.
    await Future.delayed(const Duration(seconds: 2));
  });
}
