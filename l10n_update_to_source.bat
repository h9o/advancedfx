@IF ["%~1"]==[""] (
	@echo Usage: %0 ^<HLAE build bin path to create locales in^>
	@EXIT /B 1
)

@echo Requires GNU gettext for Windows to be installed.

@echo "Project: hlae"

mkdir "%~1\locales"
cd "%~1\locales"

for %%l in (de fi hu it ja nl pl pt-BR pt-PT ru zh-CN) do (
	mkdir "%%l\hlae"
	cd "%%l\hlae"
	msgfmt --output-file=messages.mo "%~dp0deps\release\l10n\locales\%%l\hlae\messages.po"
	cd ..\..
)

cd "%~dp0"


@echo "Installing Python 3 polib ..."
py -3 -m pip install polib


@echo "Project : installer\shared\Dependency"

cd installer\shared\Dependency
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 "%~dp0\deps\release\l10n\locales\de\installer\shared\Dependency\messages.po" lang/de-DE.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 "%~dp0\deps\release\l10n\locales\fi\installer\shared\Dependency\messages.po" lang/fi-FI.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 "%~dp0\deps\release\l10n\locales\hu\installer\shared\Dependency\messages.po" lang/hu-HU.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 "%~dp0\deps\release\l10n\locales\it\installer\shared\Dependency\messages.po" lang/it-IT.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 "%~dp0\deps\release\l10n\locales\ja\installer\shared\Dependency\messages.po" lang/ja-JP.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 "%~dp0\deps\release\l10n\locales\nl\installer\shared\Dependency\messages.po" lang/nl-NL.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 "%~dp0\deps\release\l10n\locales\pl\installer\shared\Dependency\messages.po" lang/pl-PL.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 "%~dp0\deps\release\l10n\locales\pt-BR\installer\shared\Dependency\messages.po" lang/pt-BR.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 "%~dp0\deps\release\l10n\locales\pt-PT\installer\shared\Dependency\messages.po" lang/pt-PT.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 "%~dp0\deps\release\l10n\locales\ru\installer\shared\Dependency\messages.po" lang/ru-RU.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 "%~dp0\deps\release\l10n\locales\tr\installer\shared\Dependency\messages.po" lang/tr-TR.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 "%~dp0\deps\release\l10n\locales\zh-CN\installer\shared\Dependency\messages.po" lang/zh-CN.wxl
cd ..\..\..


@echo "Project : installer\HlaeFfmpeg"

cd installer\HlaeFfmpeg
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\de\installer\HlaeFfmpeg\messages.po" lang/de-DE.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\fi\installer\HlaeFfmpeg\messages.po" lang/fi-FI.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\hu\installer\HlaeFfmpeg\messages.po" lang/hu-HU.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\it\installer\HlaeFfmpeg\messages.po" lang/it-IT.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\ja\installer\HlaeFfmpeg\messages.po" lang/ja-JP.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\nl\installer\HlaeFfmpeg\messages.po" lang/nl-NL.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\pl\installer\HlaeFfmpeg\messages.po" lang/pl-PL.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\pt-BR\installer\HlaeFfmpeg\messages.po" lang/pt-BR.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\pt-PT\installer\HlaeFfmpeg\messages.po" lang/pt-PT.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\ru\installer\HlaeFfmpeg\messages.po" lang/ru-RU.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\tr\installer\HlaeFfmpeg\messages.po" lang/tr-TR.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\zh-CN\installer\HlaeFfmpeg\messages.po" lang/zh-CN.wxl
cd ..\..


@echo "Project : installer\HlaeCore"

cd installer\HlaeCore
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\de\installer\HlaeCore\messages.po" lang/de-DE.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\fi\installer\HlaeCore\messages.po" lang/fi-FI.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\hu\installer\HlaeCore\messages.po" lang/hu-HU.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\it\installer\HlaeCore\messages.po" lang/it-IT.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\ja\installer\HlaeCore\messages.po" lang/ja-JP.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\nl\installer\HlaeCore\messages.po" lang/nl-NL.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\pl\installer\HlaeCore\messages.po" lang/pl-PL.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\pt-BR\installer\HlaeCore\messages.po" lang/pt-BR.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\pt-PT\installer\HlaeCore\messages.po" lang/pt-PT.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\ru\installer\HlaeCore\messages.po" lang/ru-RU.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\tr\installer\HlaeCore\messages.po" lang/tr-TR.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\zh-CN\installer\HlaeCore\messages.po" lang/zh-CN.wxl
cd ..\..


echo "Project : installer\setup"

cd installer\setup
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\de\installer\setup\messages.po" lang/HyperlinkTheme_de-DE.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\fi\installer\setup\messages.po" lang/HyperlinkTheme_fi-FI.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\hu\installer\setup\messages.po" lang/HyperlinkTheme_hu-HU.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\it\installer\setup\messages.po" lang/HyperlinkTheme_it-IT.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\ja\installer\setup\messages.po" lang/HyperlinkTheme_ja-JP.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\nl\installer\setup\messages.po" lang/HyperlinkTheme_nl-NL.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\pl\installer\setup\messages.po" lang/HyperlinkTheme_pl-PL.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\pt-BR\installer\setup\messages.po" lang/HyperlinkTheme_pt-BR.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\pt-PT\installer\setup\messages.po" lang/HyperlinkTheme_pt-PT.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\ru\installer\setup\messages.po" lang/HyperlinkTheme_ru-RU.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\tr\installer\setup\messages.po" lang/HyperlinkTheme_tr-TR.wxl
py -3 "%~dp0\deps\dev\wxl-po-tools\po2wxl.py" -f -p -1 -l LangId "%~dp0\deps\release\l10n\locales\zh-CN\installer\setup\messages.po" lang/HyperlinkTheme_zh-CN.wxl
cd ..\..
