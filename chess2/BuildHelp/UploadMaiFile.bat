
set UnityProjectPath=%1%
set versionPath=%2%


cd "%UnityProjectPath%"


git add "%versionPath%/AssetDataFullManifest.xml" -f
git add "%versionPath%/build_config.txt" -f
git add "%versionPath%/Config.txt" -f
git add "%versionPath%/version.txt" -f
git add "%versionPath%/asset_bundle_manifest" -f
git add "%versionPath%/asset_bundle_manifest.manifest" -f
git add "%versionPath%/../Original/Sources/AssetDataFullManifest.xml" -f
git add "%versionPath%/../Original/Sources/asset_bundle_manifest" -f
git add "%versionPath%/../Original/Sources/asset_bundle_manifest.manifest" -f

git commit -m "一键提交必要文件"