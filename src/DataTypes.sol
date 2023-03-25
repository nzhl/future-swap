// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

enum OfferType {
  PROVIDING_PRICING_ASSET,
  PROVIDING_FUTURE_ASSET
}

enum OfferState {
  VALID,
  CANCELLED,
  USED
}

struct Offer {
  OfferType offerType;
  address offerer;

  uint16 collateralRatio;
  uint48 effectingTime;
  uint48 overdueTime;

  address pricingAsset;
  uint256 pricingAssetAmount;

  uint256 expectingFutureAssetAmount;

  uint256 counter;
  bytes32 signature;
}


enum AgreementState {
  ACTIVED,
  CANCELLED,
  FINISHED,
  OVERDUE
}

struct Agreement {
  uint256 id;
  AgreementState state;

  // max 10000 i.e. 100%
  uint16 collateralRatio;
  uint48 overdueTime;

  address pricingAsset;
  uint256 pricingAssetAmount;
  address pricingAssetOfferer;

  address futureAsset;
  uint256 futureAssetAmount;
  address futureAssetOfferer;

  address vault;
}
