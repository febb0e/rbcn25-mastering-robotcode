*** Settings ***
Metadata    USERNAME    %{USER=None}
Metadata    PLATFORM SYSTEM    ${{platform.system()}}
Metadata    PLATFORM VERSION    ${{platform.version()}}
