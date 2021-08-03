import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storayge/presentation/smart_widgets/info_tile/bloc/info_tile_bloc.dart';
import 'package:storayge/presentation/smart_widgets/info_tile/info_tile.dart';
import '../../../features/cabinet/bloc/cabinet_cubit.dart';
import '../../../features/cabinet/domain/entities/shelf.dart';

import '../../../core/auth/auth_cubit/auth_cubit.dart';
import '../../../core/auth/domain/entities/storayge_user.dart';
import '../../../presentation/shared/styles.dart';

// ignore_for_file: prefer_const_literals_to_create_immutables

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String shelfId = 'shelfIdaa';
    const String uid = '111cGplVA3VaHMTYRuFohrniS2vwC33';

    const Shelf shelf = Shelf(
      shelfName: "localshelfName",
      shelfId: "shelfIdha",
      shelfDesc: "shelfDesc",
      imgPath: "imgPath",
      pathName: "pathName",
      containerAmount: 1,
      itemAmount: 1,
    );

    return BlocProvider(
      create: (context) => InfoTileBloc(
        infoTileProps: const InfoTileProps(
          leadingText: 'A testament to a test.',
          child: Text(
              'This text is meant to be long. The words here do not have and will never have any significance aside from making this particular widget longer.'),
          isAbleToExpand: true,
          isExpanded: false,
          currentStatus: InfoTileStatus.loading,
        ),
      ),
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [InfoTile()],
      )),
    );
  }

  BlocBuilder<CabinetCubit, CabinetState> _buildPrototype(
      Shelf shelf, String uid, String shelfId) {
    return BlocBuilder<CabinetCubit, CabinetState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (state is CabinetInitial)
              InitialStateWidget(
                storeShelf: () {
                  storeShelf(context, shelf, uid);
                },
                getShelf: () {
                  getShelf(context, shelfId, uid);
                },
              ),
            if (state is CabinetLoading)
              const LoadingWidget(message: 'Retrieving shelf'),
            if (state is GetShelfCompleted)
              LoadedWidget(
                successMessage: 'shelf retrieved with details below',
                shelf: state.shelf,
                buttonMessage: 'Store Shelf',
                buttonMessage2: 'Get Shelf',
                storeShelf: () {
                  storeShelf(context, shelf, uid);
                },
                getShelf: () => getShelf(context, shelfId, uid),
              ),
            if (state is GetShelfError)
              ErrorMessage(
                message: state.message ?? 'No error message',
                code: state.code ?? 'No error code',
                storeShelf: () => storeShelf(context, shelf, uid),
                getShelf: () => getShelf(context, shelfId, uid),
              ),
            if (state is StoreShelfCompleted)
              LoadedWidget(
                successMessage: 'Shelf stored with the details below',
                shelf: shelf,
                buttonMessage: 'Store Shelf',
                buttonMessage2: 'Get Shelf',
                storeShelf: () {
                  storeShelf(context, shelf, uid);
                },
                getShelf: () => getShelf(context, shelfId, uid),
              ),
            if (state is StoreShelfError)
              ErrorMessage(
                message: state.message ?? 'No error message',
                code: state.code ?? 'No error code',
                storeShelf: () => storeShelf(context, shelf, uid),
                getShelf: () => getShelf(context, shelfId, uid),
              ),
          ],
        );
      },
    );
  }

  void storeShelf(
    BuildContext context,
    Shelf shelf,
    String uid,
  ) {
    context.read<CabinetCubit>().storeShelfRun(shelf: shelf, uid: uid);
  }

  void getShelf(BuildContext context, String shelfId, String uid) {
    context.read<CabinetCubit>().getShelfRun(shelfId: shelfId, uid: uid);
  }
}

class InitialStateWidget extends StatelessWidget {
  final Function()? storeShelf;
  final Function()? getShelf;

  const InitialStateWidget({
    this.getShelf,
    this.storeShelf,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Once you press this button, we will retrieve Shelf'),
        const SizedBox(
          height: 20,
        ),
        TextButton(onPressed: storeShelf, child: const Text('Store shelf')),
        const SizedBox(
          height: 10,
        ),
        TextButton(onPressed: getShelf, child: const Text('Get Shelf')),
      ],
    );
  }
}

class LoadedWidget extends StatelessWidget {
  final Shelf shelf;
  final Function()? storeShelf;
  final Function()? getShelf;
  final String buttonMessage;
  final String buttonMessage2;
  final String successMessage;

  const LoadedWidget({
    Key? key,
    this.storeShelf,
    this.getShelf,
    required this.successMessage,
    required this.shelf,
    required this.buttonMessage,
    required this.buttonMessage2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(successMessage),
        const SizedBox(height: 20),
        Text('Shelf name : ${shelf.shelfName}'),
        const SizedBox(height: 10),
        Text('Shelf id : ${shelf.shelfId}'),
        const SizedBox(height: 10),
        Text('Shelf desc : ${shelf.shelfDesc}'),
        const SizedBox(height: 10),
        Text('Container amount : ${shelf.containerAmount}'),
        const SizedBox(height: 20),
        TextButton(onPressed: storeShelf, child: Text(buttonMessage)),
        const SizedBox(height: 10),
        TextButton(onPressed: getShelf, child: Text(buttonMessage2)),
      ],
    );
  }
}

class LoadingWidget extends StatelessWidget {
  final String message;

  const LoadingWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircularProgressIndicator(),
        Text(message),
      ],
    );
  }
}

class ErrorMessage extends StatelessWidget {
  final String message;
  final String code;
  final Function()? getShelf;
  final Function()? storeShelf;

  const ErrorMessage({
    Key? key,
    required this.message,
    required this.getShelf,
    required this.storeShelf,
    required this.code,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Icon(Icons.error),
        const SizedBox(height: 20),
        Text(message),
        const SizedBox(height: 10),
        Text(code),
        const SizedBox(height: 20),
        TextButton(
            onPressed: getShelf,
            child: const Text('Attempt to retrieve shelf')),
        const SizedBox(height: 10),
        TextButton(
            onPressed: storeShelf,
            child: const Text('Attempt to create shelf')),
      ],
    );
  }
}

class UnknownError extends StatelessWidget {
  const UnknownError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Unexpected. You should not even be here.');
  }
}
