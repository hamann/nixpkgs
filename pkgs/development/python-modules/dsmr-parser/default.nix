{ lib
, buildPythonPackage
, dlms-cosem
, fetchFromGitHub
, pyserial
, pyserial-asyncio
, pytestCheckHook
, pythonOlder
, pytz
, tailer
}:

buildPythonPackage rec {
  pname = "dsmr-parser";
  version = "1.2.1";
  format = "setuptools";

  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "ndokter";
    repo = "dsmr_parser";
    rev = "refs/tags/v${version}";
    hash = "sha256-a02bpC9CVecAtIfWbLM74K4thaGI2GferEnJQKtIiu8=";
  };

  propagatedBuildInputs = [
    dlms-cosem
    pyserial
    pyserial-asyncio
    pytz
    tailer
  ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "dsmr_parser"
  ];

  meta = with lib; {
    description = "Python module to parse Dutch Smart Meter Requirements (DSMR)";
    homepage = "https://github.com/ndokter/dsmr_parser";
    changelog = "https://github.com/ndokter/dsmr_parser/releases/tag/v${version}";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ fab ];
  };
}
