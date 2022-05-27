part of 'bank_page_cubit.dart';

@immutable
abstract class BankPageState {}

class BankPageInitial extends BankPageState {}

class BankPageLoading extends BankPageState {}

class BankPageLoaded extends BankPageState {
  final Bank bank;
  final List<RecentBank> recentBanks;
  BankPageLoaded({
    required this.bank,
    required this.recentBanks,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BankPageLoaded &&
        other.bank == bank &&
        listEquals(other.recentBanks, recentBanks);
  }

  @override
  int get hashCode => bank.hashCode ^ recentBanks.hashCode;

  @override
  String toString() => 'BankPageLoaded(bank: $bank, recentBanks: $recentBanks)';
}

class BankPageFailed extends BankPageState {
  final String errorMsg;
  BankPageFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BankPageFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'BankPageFailed(errorMsg: $errorMsg)';
}
