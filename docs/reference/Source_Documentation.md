## Modules

<dl>
<dt><a href="#module_PackageObject">PackageObject</a></dt>
<dd><p>This Module is used to aide in building Package Objects.
Allowing a singular location for the proper data structure of a package object.
And allowing an easy interface to add, modify, or retreive data about a
package object.</p>
</dd>
<dt><a href="#module_ServerStatusObject">ServerStatusObject</a></dt>
<dd><p>This Module is used to aide in building a Server Status Object.
This data structure is somewhat ubiquitous within this codebase.
A builder allows the actual data structure to be obscurred
with less concern over creating the object properly and more concerned
with providing the correct values.</p>
</dd>
<dt><a href="#module_cache">cache</a></dt>
<dd><p>Provides an interface for helpful caching mechanisms.
Originally created after some circular dependency issues arouse during
rapid redevelopment of the entire storage system.
But this does provide an opportunity to allow multiple caching systems.</p>
</dd>
<dt><a href="#module_config">config</a></dt>
<dd><p>Module that access&#39; and returns the server wide configuration.</p>
</dd>
<dt><a href="#module_database">database</a></dt>
<dd><p>Provides an interface of a large collection of functions to interact
with and retrieve data from the cloud hosted database instance.</p>
</dd>
<dt><a href="#module_debug_util">debug_util</a></dt>
<dd><p>A collection of simple functions to help devs debug the application during runtime,
to better assist in tracking down bugs. Since many sets of data cannot be reliably output to the console
this can help to view the transmutations of data as its handled.</p>
</dd>
<dt><a href="#module_dev_server">dev_server</a></dt>
<dd><p>The Development initializer of <code>main.js</code> as well as managing the startup of a locally created Docker SQL
Server. This uses pg-test to set up a database hosted on local Docker. Migrating all data as needed,
to allow the real server feel, without having access or the risk of the production database. But otherwise runs
the backend API server as normal.</p>
</dd>
<dt><a href="#module_logger">logger</a></dt>
<dd><p>Allows easy logging of the server. Allowing it to become simple to add additional
logging methods if a log server is ever implemented.</p>
</dd>
<dt><a href="#module_main">main</a></dt>
<dd><p>The Main functionality for the entire server. Sets up the Express server, providing
all endpoints it listens on. With those endpoints being further documented in <code>api.md</code>.</p>
</dd>
<dt><a href="#module_query">query</a></dt>
<dd><p>Home to parsing all query parameters from the <code>Request</code> object. Ensuring a valid response.
While most values will just return their default there are some expecptions:
engine(): Returns false if not defined, to allow a fast way to determine if results need to be pruned.</p>
</dd>
<dt><a href="#module_server">server</a></dt>
<dd><p>The initializer of <code>main.js</code> starting up the Express Server, and setting the port
to listen on. As well as handling a graceful shutdown of the server.</p>
</dd>
<dt><a href="#module_storage">storage</a></dt>
<dd><p>This module is the second generation of data storage methodology,
in which this provides static access to files stored within regular cloud
file storage. Specifically intended for use with Google Cloud Storage.</p>
</dd>
<dt><a href="#module_utils">utils</a></dt>
<dd><p>A helper for any functions that are agnostic in handlers.</p>
</dd>
<dt><a href="#module_vcs">vcs</a></dt>
<dd><p>This Module is intended to be the platform agnostic tool to interaction
with Version Control Systems of different types in the cloud.
To collect data from them, format it accordingly ang return it to the requesting
function.</p>
</dd>
<dt><a href="#module_common_handler">common_handler</a></dt>
<dd><p>Provides a simplistic way to refer to implement common endpoint returns.
So these can be called as an async function without more complex functions, reducing
verbosity, and duplication within the codebase.</p>
</dd>
<dt><a href="#module_oauth_handler">oauth_handler</a></dt>
<dd><p>Endpoint Handlers for Authentication URLs</p>
</dd>
<dt><a href="#module_package_handler">package_handler</a></dt>
<dd><p>Endpoint Handlers in all relating to the packages themselves.</p>
</dd>
<dt><a href="#module_star_handler">star_handler</a></dt>
<dd><p>Handler for any endpoints whose slug after <code>/api/</code> is <code>star</code>.</p>
</dd>
<dt><a href="#module_theme_handler">theme_handler</a></dt>
<dd><p>Endpoint Handlers relating to themes only.</p>
</dd>
<dt><a href="#module_update_handler">update_handler</a></dt>
<dd><p>Endpoint Handlers relating to updating the editor.</p>
</dd>
<dt><a href="#module_user_handler">user_handler</a></dt>
<dd><p>Handler for endpoints whose slug after <code>/api/</code> is <code>user</code>.</p>
</dd>
</dl>

## Functions

<dl>
<dt><a href="#verifyAuth">verifyAuth()</a> ⇒ <code>object</code></dt>
<dd><p>This will be the major function to determine, confirm, and provide user
details of an authenticated user. This will take a users provided token,
and use it to check GitHub for the details of whoever owns this token.
Once that is done, we can go ahead and search for said user within the database.
If the user exists, then we can confirm that they are both locally and globally
authenticated, and execute whatever action it is they wanted to.</p>
</dd>
<dt><a href="#getUserDataDevMode">getUserDataDevMode()</a> ⇒ <code>object</code></dt>
<dd><p>An internal util to retrieve the user data object in developer mode only.</p>
</dd>
</dl>

## Typedefs

<dl>
<dt><a href="#ServerStatusObject">ServerStatusObject</a> : <code>object</code></dt>
<dd><p>The Generic Object that should be returned by nearly every function
within every module. Allows ease of bubbling errors to the HTTP Handler.</p>
</dd>
<dt><a href="#SSO_VCS_newVersionData">SSO_VCS_newVersionData</a> : <code>object</code></dt>
<dd><p>The Server Status Object returned by <code>vcs.newVersionData()</code> containing all
the data needed to update a packages version.</p>
</dd>
</dl>

<a name="module_PackageObject"></a>

## PackageObject
This Module is used to aide in building Package Objects.
Allowing a singular location for the proper data structure of a package object.
And allowing an easy interface to add, modify, or retreive data about a
package object.


* [PackageObject](#module_PackageObject)
    * [~PackageObject](#module_PackageObject..PackageObject)
    * [~Version](#module_PackageObject..Version)
    * [~setName(packNameString)](#module_PackageObject..setName)
    * [~setOwnerRepo(ownerRepoString)](#module_PackageObject..setOwnerRepo)
    * [~setDownloads(downloadCount)](#module_PackageObject..setDownloads)
    * [~setStargazers(stargazerCount)](#module_PackageObject..setStargazers)
    * [~setReadme(readmeString)](#module_PackageObject..setReadme)
    * [~setRepository(repoObject)](#module_PackageObject..setRepository)
    * [~setRepositoryType(repoType)](#module_PackageObject..setRepositoryType)
    * [~setRepositoryURL(repoURL)](#module_PackageObject..setRepositoryURL)
    * [~setCreationMethod(method)](#module_PackageObject..setCreationMethod)
    * [~parse(pack)](#module_PackageObject..parse)
    * [~buildShort()](#module_PackageObject..buildShort)
    * [~buildFull()](#module_PackageObject..buildFull)
    * [~addVersion(value)](#module_PackageObject..addVersion)
    * [~addVersions(values)](#module_PackageObject..addVersions)
    * [~addSemver(semver)](#module_PackageObject..addSemver)
    * [~cleanSemver(semver)](#module_PackageObject..cleanSemver)
    * [~addTarball(semver, tarballURL)](#module_PackageObject..addTarball)
    * [~addSha(semver, sha)](#module_PackageObject..addSha)
    * [~addPackageJSON(semver, pack)](#module_PackageObject..addPackageJSON)
    * [~getLatestVersion()](#module_PackageObject..getLatestVersion)
    * [~getLatestVersionSemver()](#module_PackageObject..getLatestVersionSemver)
    * [~getLatestVersionTarball()](#module_PackageObject..getLatestVersionTarball)
    * [~getLatestVersionSha()](#module_PackageObject..getLatestVersionSha)
    * [~getLatestVersionPackageJSON()](#module_PackageObject..getLatestVersionPackageJSON)
    * [~buildFullVersions()](#module_PackageObject..buildFullVersions)

<a name="module_PackageObject..PackageObject"></a>

### PackageObject~PackageObject
The PackageObject Object Builder

**Kind**: inner class of [<code>PackageObject</code>](#module_PackageObject)  
<a name="module_PackageObject..Version"></a>

### PackageObject~Version
A version object to help build package objects `Version` data. Accessible
from the PackageObject via `PackageObject.Version`

**Kind**: inner class of [<code>PackageObject</code>](#module_PackageObject)  
<a name="module_PackageObject..setName"></a>

### PackageObject~setName(packNameString)
Allows setting the name of the package.

**Kind**: inner method of [<code>PackageObject</code>](#module_PackageObject)  

| Param | Type | Description |
| --- | --- | --- |
| packNameString | <code>string</code> | The Name of the package to set |

<a name="module_PackageObject..setOwnerRepo"></a>

### PackageObject~setOwnerRepo(ownerRepoString)
Allows setting the `owner/repo` of the package.

**Kind**: inner method of [<code>PackageObject</code>](#module_PackageObject)  

| Param | Type | Description |
| --- | --- | --- |
| ownerRepoString | <code>string</code> | The `owner/repo` string combo to set for the package. |

<a name="module_PackageObject..setDownloads"></a>

### PackageObject~setDownloads(downloadCount)
Allows setting the packages download count.

**Kind**: inner method of [<code>PackageObject</code>](#module_PackageObject)  

| Param | Type | Description |
| --- | --- | --- |
| downloadCount | <code>number</code> \| <code>string</code> | The Download count to add. |

<a name="module_PackageObject..setStargazers"></a>

### PackageObject~setStargazers(stargazerCount)
Allows setting the packages stargazer count.

**Kind**: inner method of [<code>PackageObject</code>](#module_PackageObject)  

| Param | Type | Description |
| --- | --- | --- |
| stargazerCount | <code>number</code> \| <code>string</code> | The Stargazers count to add. |

<a name="module_PackageObject..setReadme"></a>

### PackageObject~setReadme(readmeString)
Allows setting the packages readme data.

**Kind**: inner method of [<code>PackageObject</code>](#module_PackageObject)  

| Param | Type | Description |
| --- | --- | --- |
| readmeString | <code>string</code> | The Full text based readme. |

<a name="module_PackageObject..setRepository"></a>

### PackageObject~setRepository(repoObject)
Allows setting the repository object of a package. As returned by
`VCS.determineProvider()`.

**Kind**: inner method of [<code>PackageObject</code>](#module_PackageObject)  

| Param | Type | Description |
| --- | --- | --- |
| repoObject | <code>object</code> | The repo object containing `type` and `url` keys. |

<a name="module_PackageObject..setRepositoryType"></a>

### PackageObject~setRepositoryType(repoType)
Allows setting the repo type of the package. As returned by `VCS.determineProvider().type`

**Kind**: inner method of [<code>PackageObject</code>](#module_PackageObject)  

| Param | Type | Description |
| --- | --- | --- |
| repoType | <code>string</code> | The type of repo. |

<a name="module_PackageObject..setRepositoryURL"></a>

### PackageObject~setRepositoryURL(repoURL)
Allows setting the repo URL of the package. As returned
by `VCS.determineProvider().url`

**Kind**: inner method of [<code>PackageObject</code>](#module_PackageObject)  

| Param | Type | Description |
| --- | --- | --- |
| repoURL | <code>string</code> | The URL of the repo. |

<a name="module_PackageObject..setCreationMethod"></a>

### PackageObject~setCreationMethod(method)
Allows setting a creation method for the package.

**Kind**: inner method of [<code>PackageObject</code>](#module_PackageObject)  

| Param | Type | Description |
| --- | --- | --- |
| method | <code>string</code> | The creation method of the package. |

<a name="module_PackageObject..parse"></a>

### PackageObject~parse(pack)
Unimplemented function.

**Kind**: inner method of [<code>PackageObject</code>](#module_PackageObject)  
**Todo**

- [ ] Implement generic parse()


| Param | Type | Description |
| --- | --- | --- |
| pack | <code>object</code> | N/A |

<a name="module_PackageObject..buildShort"></a>

### PackageObject~buildShort()
Returns an object matching the `Package Object Short` format, using provided data.

**Kind**: inner method of [<code>PackageObject</code>](#module_PackageObject)  
<a name="module_PackageObject..buildFull"></a>

### PackageObject~buildFull()
Returns an object matching the `Package Object Full` format.
Using the provided data.

**Kind**: inner method of [<code>PackageObject</code>](#module_PackageObject)  
<a name="module_PackageObject..addVersion"></a>

### PackageObject~addVersion(value)
Unimplemented function.

**Kind**: inner method of [<code>PackageObject</code>](#module_PackageObject)  
**Todo**

- [ ] Implement Agnostic `addVersion()`


| Param | Type | Description |
| --- | --- | --- |
| value | <code>object</code> | N/A |

<a name="module_PackageObject..addVersions"></a>

### PackageObject~addVersions(values)
An array handling variant that relies on the the unimplmented `addVersion`

**Kind**: inner method of [<code>PackageObject</code>](#module_PackageObject)  
**Todo**

- [ ] Implement Agnostic `addVersion()`


| Param | Type | Description |
| --- | --- | --- |
| values | <code>Array.&lt;object&gt;</code> | N/A |

<a name="module_PackageObject..addSemver"></a>

### PackageObject~addSemver(semver)
Handles adding a new semver value.

**Kind**: inner method of [<code>PackageObject</code>](#module_PackageObject)  

| Param | Type | Description |
| --- | --- | --- |
| semver | <code>string</code> | The Semver to add to the package. |

<a name="module_PackageObject..cleanSemver"></a>

### PackageObject~cleanSemver(semver)
A utility function that will parse and process a `semver` string
to remove special characters, and remove any leading `v`s

**Kind**: inner method of [<code>PackageObject</code>](#module_PackageObject)  

| Param | Type | Description |
| --- | --- | --- |
| semver | <code>string</code> | The Semver to clean. |

<a name="module_PackageObject..addTarball"></a>

### PackageObject~addTarball(semver, tarballURL)
Adds a `tarball` to the version specified.

**Kind**: inner method of [<code>PackageObject</code>](#module_PackageObject)  

| Param | Type | Description |
| --- | --- | --- |
| semver | <code>string</code> | The `semver` to add it to. |
| tarballURL | <code>string</code> | The url of the `tarball` to add. |

<a name="module_PackageObject..addSha"></a>

### PackageObject~addSha(semver, sha)
Adds a `sha` to the `version` specified.

**Kind**: inner method of [<code>PackageObject</code>](#module_PackageObject)  

| Param | Type | Description |
| --- | --- | --- |
| semver | <code>string</code> | The `semver` to add it to. |
| sha | <code>string</code> | The SHA to add. |

<a name="module_PackageObject..addPackageJSON"></a>

### PackageObject~addPackageJSON(semver, pack)
Adds a `package.json` to a specific version.

**Kind**: inner method of [<code>PackageObject</code>](#module_PackageObject)  

| Param | Type | Description |
| --- | --- | --- |
| semver | <code>string</code> | The `semver` to add it to. |
| pack | <code>object</code> | The `package.json` to add. |

<a name="module_PackageObject..getLatestVersion"></a>

### PackageObject~getLatestVersion()
Returns the full data of the `latest` version. As stored locally.
This likely is not suited for using as any kind of package data.

**Kind**: inner method of [<code>PackageObject</code>](#module_PackageObject)  
<a name="module_PackageObject..getLatestVersionSemver"></a>

### PackageObject~getLatestVersionSemver()
Returns the `semver` of the `latest` version.

**Kind**: inner method of [<code>PackageObject</code>](#module_PackageObject)  
<a name="module_PackageObject..getLatestVersionTarball"></a>

### PackageObject~getLatestVersionTarball()
Returns the `tarball` of the `latest` version.

**Kind**: inner method of [<code>PackageObject</code>](#module_PackageObject)  
<a name="module_PackageObject..getLatestVersionSha"></a>

### PackageObject~getLatestVersionSha()
Returns the `sha` of the `latest` version.

**Kind**: inner method of [<code>PackageObject</code>](#module_PackageObject)  
<a name="module_PackageObject..getLatestVersionPackageJSON"></a>

### PackageObject~getLatestVersionPackageJSON()
Returns the `package.json` data for the `latest` semver.

**Kind**: inner method of [<code>PackageObject</code>](#module_PackageObject)  
<a name="module_PackageObject..buildFullVersions"></a>

### PackageObject~buildFullVersions()
Returns an object of the full version object for the versions provided.

**Kind**: inner method of [<code>PackageObject</code>](#module_PackageObject)  
<a name="module_ServerStatusObject"></a>

## ServerStatusObject
This Module is used to aide in building a Server Status Object.
This data structure is somewhat ubiquitous within this codebase.
A builder allows the actual data structure to be obscurred
with less concern over creating the object properly and more concerned
with providing the correct values.


* [ServerStatusObject](#module_ServerStatusObject)
    * [~ServerStatus](#module_ServerStatusObject..ServerStatus)
    * [~isOk()](#module_ServerStatusObject..isOk)
    * [~notOk()](#module_ServerStatusObject..notOk)
    * [~setShort(value)](#module_ServerStatusObject..setShort)
    * [~setContent(value)](#module_ServerStatusObject..setContent)
    * [~build()](#module_ServerStatusObject..build)

<a name="module_ServerStatusObject..ServerStatus"></a>

### ServerStatusObject~ServerStatus
The ServerStatus Object Builder

**Kind**: inner class of [<code>ServerStatusObject</code>](#module_ServerStatusObject)  
<a name="module_ServerStatusObject..isOk"></a>

### ServerStatusObject~isOk()
When called sets the SSO's `ok` to true.

**Kind**: inner method of [<code>ServerStatusObject</code>](#module_ServerStatusObject)  
<a name="module_ServerStatusObject..notOk"></a>

### ServerStatusObject~notOk()
When called sets the SSO's `ok` to false.

**Kind**: inner method of [<code>ServerStatusObject</code>](#module_ServerStatusObject)  
<a name="module_ServerStatusObject..setShort"></a>

### ServerStatusObject~setShort(value)
Allows quick setting of the `short` value.

**Kind**: inner method of [<code>ServerStatusObject</code>](#module_ServerStatusObject)  

| Param | Type | Description |
| --- | --- | --- |
| value | <code>\*</code> | The contents of the value. |

<a name="module_ServerStatusObject..setContent"></a>

### ServerStatusObject~setContent(value)
Allows quick setting of the `content` value.

**Kind**: inner method of [<code>ServerStatusObject</code>](#module_ServerStatusObject)  

| Param | Type | Description |
| --- | --- | --- |
| value | <code>\*</code> | The contents of the value. |

<a name="module_ServerStatusObject..build"></a>

### ServerStatusObject~build()
Builds a proper JavaScript Object for the current values.

**Kind**: inner method of [<code>ServerStatusObject</code>](#module_ServerStatusObject)  
<a name="module_cache"></a>

## cache
Provides an interface for helpful caching mechanisms.
Originally created after some circular dependency issues arouse during
rapid redevelopment of the entire storage system.
But this does provide an opportunity to allow multiple caching systems.


* [cache](#module_cache)
    * [~CacheObject](#module_cache..CacheObject)
        * [new CacheObject([name], contents)](#new_module_cache..CacheObject_new)

<a name="module_cache..CacheObject"></a>

### cache~CacheObject
**Kind**: inner class of [<code>cache</code>](#module_cache)  
<a name="new_module_cache..CacheObject_new"></a>

#### new CacheObject([name], contents)
Allows simple interfaces to handle caching an object in memory. Used to cache data read from the filesystem.


| Param | Type | Description |
| --- | --- | --- |
| [name] | <code>string</code> | Optional name to assign to the Cached Object. |
| contents | <code>object</code> | The contents of this cached object. Intended to be a JavaScript object. But could be anything. |

<a name="module_config"></a>

## config
Module that access' and returns the server wide configuration.


* [config](#module_config)
    * [~getConfigFile()](#module_config..getConfigFile) ⇒ <code>object</code>
    * [~getConfig()](#module_config..getConfig) ⇒ <code>object</code>

<a name="module_config..getConfigFile"></a>

### config~getConfigFile() ⇒ <code>object</code>
Used to read the `yaml` config file from the root of the project.
Returning the YAML parsed file, or an empty obj.

**Kind**: inner method of [<code>config</code>](#module_config)  
**Returns**: <code>object</code> - A parsed YAML file config, or an empty object.  
<a name="module_config..getConfig"></a>

### config~getConfig() ⇒ <code>object</code>
Used to get Server Config data from the `app.yaml` file at the root of the project.
Or from environment variables. Prioritizing environment variables.

**Kind**: inner method of [<code>config</code>](#module_config)  
**Returns**: <code>object</code> - The different available configuration values.  
**Example** *(Using &#x60;getConfig()&#x60; during an import for a single value.)*  
```js
const { search_algorithm } = require("./config.js").getConfig();
```
<a name="module_database"></a>

## database
Provides an interface of a large collection of functions to interact
with and retrieve data from the cloud hosted database instance.


* [database](#module_database)
    * [~setupSQL()](#module_database..setupSQL) ⇒ <code>object</code>
    * [~shutdownSQL()](#module_database..shutdownSQL)
    * [~packageNameAvailability(name)](#module_database..packageNameAvailability) ⇒ <code>object</code>
    * [~insertNewPackage(pack)](#module_database..insertNewPackage) ⇒ <code>object</code>
    * [~insertNewPackageVersion(packJSON, oldName)](#module_database..insertNewPackageVersion) ⇒ <code>object</code>
    * [~insertNewPackageName(newName, oldName)](#module_database..insertNewPackageName) ⇒ <code>object</code>
    * [~insertNewUser(username, id, avatar)](#module_database..insertNewUser) ⇒ <code>object</code>
    * [~getPackageByName(name, user)](#module_database..getPackageByName) ⇒ <code>object</code>
    * [~getPackageByNameSimple(name)](#module_database..getPackageByNameSimple) ⇒ <code>object</code>
    * [~getPackageVersionByNameAndVersion(name, version)](#module_database..getPackageVersionByNameAndVersion) ⇒ <code>object</code>
    * [~getPackageCollectionByName(packArray)](#module_database..getPackageCollectionByName) ⇒ <code>object</code>
    * [~getPackageCollectionByID(packArray)](#module_database..getPackageCollectionByID) ⇒ <code>object</code>
    * [~updatePackageStargazers(name, pointer)](#module_database..updatePackageStargazers) ⇒ <code>object</code>
    * [~updatePackageIncrementDownloadByName(name)](#module_database..updatePackageIncrementDownloadByName) ⇒ <code>object</code>
    * [~updatePackageDecrementDownloadByName(name)](#module_database..updatePackageDecrementDownloadByName) ⇒ <code>object</code>
    * [~removePackageByName(name)](#module_database..removePackageByName) ⇒ <code>object</code>
    * [~removePackageVersion(packName, semVer)](#module_database..removePackageVersion) ⇒ <code>object</code>
    * [~getFeaturedPackages()](#module_database..getFeaturedPackages) ⇒ <code>object</code>
    * [~getFeaturedThemes()](#module_database..getFeaturedThemes) ⇒ <code>object</code>
    * [~getUserByName(username)](#module_database..getUserByName) ⇒ <code>object</code>
    * [~getUserByNodeID(id)](#module_database..getUserByNodeID) ⇒ <code>object</code>
    * [~getUserByID(id)](#module_database..getUserByID) ⇒ <code>object</code>
    * [~updateIncrementStar(user, pack)](#module_database..updateIncrementStar) ⇒ <code>object</code>
    * [~updateDecrementStar(user, pack)](#module_database..updateDecrementStar) ⇒ <code>object</code>
    * [~getStarredPointersByUserID(userid)](#module_database..getStarredPointersByUserID) ⇒ <code>object</code>
    * [~getStarringUsersByPointer(pointer)](#module_database..getStarringUsersByPointer) ⇒ <code>object</code>
    * [~simpleSearch(term, dir, sort, [themes])](#module_database..simpleSearch) ⇒ <code>object</code>
    * [~getUserCollectionById(ids)](#module_database..getUserCollectionById) ⇒ <code>object</code>
    * [~getSortedPackages(page, dir, method, [themes])](#module_database..getSortedPackages) ⇒ <code>object</code>
    * [~getOrderField(method, sqlStorage)](#module_database..getOrderField) ⇒ <code>object</code> \| <code>null</code>
    * [~authStoreStateKey(stateKey)](#module_database..authStoreStateKey) ⇒ <code>object</code>
    * [~authCheckAndDeleteStateKey(stateKey, timestamp)](#module_database..authCheckAndDeleteStateKey) ⇒ <code>object</code>

<a name="module_database..setupSQL"></a>

### database~setupSQL() ⇒ <code>object</code>
Initialize the connection to the PostgreSQL database.
In order to avoid the initialization multiple times,
the logical nullish assignment (??=) can be used in the caller.
Exceptions thrown here should be caught and handled in the caller.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - PostgreSQL connection object.  
<a name="module_database..shutdownSQL"></a>

### database~shutdownSQL()
Ensures any Database connection is properly, and safely closed before exiting.

**Kind**: inner method of [<code>database</code>](#module_database)  
<a name="module_database..packageNameAvailability"></a>

### database~packageNameAvailability(name) ⇒ <code>object</code>
Determines if a name is ready to be used for a new package. Useful in the stage of the publication
of a new package where checking if the package exists is not enough because a name could be not
available if a deleted package was using it in the past.
Useful also to check if a name is available for the renaming of a published package.
This function simply checks if the provided name is present in "names" table.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - A Server Status Object.  

| Param | Type | Description |
| --- | --- | --- |
| name | <code>string</code> | The candidate name for a new package. |

<a name="module_database..insertNewPackage"></a>

### database~insertNewPackage(pack) ⇒ <code>object</code>
Insert a new package inside the DB taking a `Server Object Full` as argument.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - A Server Status Object.  

| Param | Type | Description |
| --- | --- | --- |
| pack | <code>object</code> | The `Server Object Full` package. |

<a name="module_database..insertNewPackageVersion"></a>

### database~insertNewPackageVersion(packJSON, oldName) ⇒ <code>object</code>
Adds a new package version to the db.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - A server status object.  

| Param | Type | Description |
| --- | --- | --- |
| packJSON | <code>object</code> | A full `package.json` file for the wanted version. |
| oldName | <code>string</code> \| <code>null</code> | If provided, the old name to be replaced for the renaming of the package. |

<a name="module_database..insertNewPackageName"></a>

### database~insertNewPackageName(newName, oldName) ⇒ <code>object</code>
Insert a new package name with the same pointer as the old name.
This essentially renames an existing package.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - A server status object.  
**Todo**

- [ ] This function has been left only for testing purpose since it has been integrated
inside insertNewPackageVersion, so it should be removed when we can test the rename process
directly on the endpoint.


| Param | Type | Description |
| --- | --- | --- |
| newName | <code>string</code> | The new name to create in the DB. |
| oldName | <code>string</code> | The original name of which to use the pointer of. |

<a name="module_database..insertNewUser"></a>

### database~insertNewUser(username, id, avatar) ⇒ <code>object</code>
Insert a new user into the database.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - A server status object.  

| Param | Type | Description |
| --- | --- | --- |
| username | <code>string</code> | Username of the user. |
| id | <code>object</code> | Identifier code of the user. |
| avatar | <code>object</code> | The avatar of the user. |

<a name="module_database..getPackageByName"></a>

### database~getPackageByName(name, user) ⇒ <code>object</code>
Takes a package name and returns the raw SQL package with all its versions.
This module is also used to get the data to be sent to utils.constructPackageObjectFull()
in order to convert the query result in Package Object Full format.
In that case it's recommended to set the user flag as true for security reasons.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - A server status object.  

| Param | Type | Description |
| --- | --- | --- |
| name | <code>string</code> | The name of the package. |
| user | <code>bool</code> | Whether the packages has to be exposed outside or not. If true, all sensitive data like primary and foreign keys are not selected. Even if the keys are ignored by utils.constructPackageObjectFull(), it's still safe to not inclue them in case, by mistake, we publish the return of this module. |

<a name="module_database..getPackageByNameSimple"></a>

### database~getPackageByNameSimple(name) ⇒ <code>object</code>
Internal util used by other functions in this module to get the package row by the given name.
It's like getPackageByName(), but with a simple and faster query.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - A server status object.  

| Param | Type | Description |
| --- | --- | --- |
| name | <code>string</code> | The name of the package. |

<a name="module_database..getPackageVersionByNameAndVersion"></a>

### database~getPackageVersionByNameAndVersion(name, version) ⇒ <code>object</code>
Uses the name of a package and it's version to return the version info.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - A server status object.  

| Param | Type | Description |
| --- | --- | --- |
| name | <code>string</code> | The name of the package to query. |
| version | <code>string</code> | The version of the package to query. |

<a name="module_database..getPackageCollectionByName"></a>

### database~getPackageCollectionByName(packArray) ⇒ <code>object</code>
Takes a package name array, and returns an array of the package objects.
You must ensure that the packArray passed is compatible. This function does not coerce compatibility.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - A server status object.  

| Param | Type | Description |
| --- | --- | --- |
| packArray | <code>Array.&lt;string&gt;</code> | An array of package name strings. |

<a name="module_database..getPackageCollectionByID"></a>

### database~getPackageCollectionByID(packArray) ⇒ <code>object</code>
Takes a package pointer array, and returns an array of the package objects.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - A server status object.  

| Param | Type | Description |
| --- | --- | --- |
| packArray | <code>Array.&lt;int&gt;</code> | An array of package id. |

<a name="module_database..updatePackageStargazers"></a>

### database~updatePackageStargazers(name, pointer) ⇒ <code>object</code>
Internal util that uses the package name (or pointer if provided) to update its stargazers count.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - The effected server status object.  

| Param | Type | Description |
| --- | --- | --- |
| name | <code>string</code> | The package name. |
| pointer | <code>string</code> | The package id (if given, the search by name is skipped). |

<a name="module_database..updatePackageIncrementDownloadByName"></a>

### database~updatePackageIncrementDownloadByName(name) ⇒ <code>object</code>
Uses the package name to increment the download count by one.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - The modified server status object.  

| Param | Type | Description |
| --- | --- | --- |
| name | <code>string</code> | The package name. |

<a name="module_database..updatePackageDecrementDownloadByName"></a>

### database~updatePackageDecrementDownloadByName(name) ⇒ <code>object</code>
Uses the package name to decrement the download count by one.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - The modified server status object.  

| Param | Type | Description |
| --- | --- | --- |
| name | <code>string</code> | The package name. |

<a name="module_database..removePackageByName"></a>

### database~removePackageByName(name) ⇒ <code>object</code>
Given a package name, removes its record alongside its names, versions, stars.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - A server status object.  

| Param | Type | Description |
| --- | --- | --- |
| name | <code>string</code> | The package name. |

<a name="module_database..removePackageVersion"></a>

### database~removePackageVersion(packName, semVer) ⇒ <code>object</code>
Mark a version of a specific package as deleted. This does not delete the record,
just mark the boolean deleted flag as true, but only if one published version remains available.
This also makes sure that a new latest version is selected in case the previous one is removed.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - A server status object.  

| Param | Type | Description |
| --- | --- | --- |
| packName | <code>string</code> | The package name. |
| semVer | <code>string</code> | The version to remove. |

<a name="module_database..getFeaturedPackages"></a>

### database~getFeaturedPackages() ⇒ <code>object</code>
Collects the hardcoded featured packages array from the storage.js
module. Then uses this.getPackageCollectionByName to retrieve details of the
package.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - A server status object.  
<a name="module_database..getFeaturedThemes"></a>

### database~getFeaturedThemes() ⇒ <code>object</code>
Collects the hardcoded featured themes array from the storage.js module.
Then uses this.getPackageCollectionByName to retrieve details of the package.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - A server status object.  
<a name="module_database..getUserByName"></a>

### database~getUserByName(username) ⇒ <code>object</code>
Get a users details providing their username.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - A server status object.  

| Param | Type | Description |
| --- | --- | --- |
| username | <code>string</code> | User name string. |

<a name="module_database..getUserByNodeID"></a>

### database~getUserByNodeID(id) ⇒ <code>object</code>
Get user details providing their Node ID.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - A server status object.  

| Param | Type | Description |
| --- | --- | --- |
| id | <code>string</code> | Users Node ID. |

<a name="module_database..getUserByID"></a>

### database~getUserByID(id) ⇒ <code>object</code>
Get user details providing their ID.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - A Server status Object.  

| Param | Type | Description |
| --- | --- | --- |
| id | <code>int</code> | User ID |

<a name="module_database..updateIncrementStar"></a>

### database~updateIncrementStar(user, pack) ⇒ <code>object</code>
Register the star given by a user to a package.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - A server status object.  

| Param | Type | Description |
| --- | --- | --- |
| user | <code>int</code> | A User Object that should star the package. |
| pack | <code>string</code> | Package name that get the new star. |

<a name="module_database..updateDecrementStar"></a>

### database~updateDecrementStar(user, pack) ⇒ <code>object</code>
Register the removal of the star on a package by a user.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - A server status object.  

| Param | Type | Description |
| --- | --- | --- |
| user | <code>int</code> | User Object who remove the star. |
| pack | <code>string</code> | Package name that get the star removed. |

<a name="module_database..getStarredPointersByUserID"></a>

### database~getStarredPointersByUserID(userid) ⇒ <code>object</code>
Get all packages which the user gave the star.
The result of this function should not be returned to the user because it contains pointers UUID.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - A server status object.  

| Param | Type | Description |
| --- | --- | --- |
| userid | <code>int</code> | ID of the user. |

<a name="module_database..getStarringUsersByPointer"></a>

### database~getStarringUsersByPointer(pointer) ⇒ <code>object</code>
Use the pointer of a package to collect all users that have starred it.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - A server status object.  

| Param | Type | Description |
| --- | --- | --- |
| pointer | <code>string</code> | The ID of the package. |

<a name="module_database..simpleSearch"></a>

### database~simpleSearch(term, dir, sort, [themes]) ⇒ <code>object</code>
The current Fuzzy-Finder implementation of search. Ideally eventually
will use a more advanced search method.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - A server status object containing the results and the pagination object.  

| Param | Type | Default | Description |
| --- | --- | --- | --- |
| term | <code>string</code> |  | The search term. |
| dir | <code>string</code> |  | String flag for asc/desc order. |
| sort | <code>string</code> |  | The sort method. |
| [themes] | <code>boolean</code> | <code>false</code> | Optional Parameter to specify if this should only return themes. |

<a name="module_database..getUserCollectionById"></a>

### database~getUserCollectionById(ids) ⇒ <code>object</code>
Returns an array of Users and their associated data via the ids.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - A server status object with the array of users collected.  

| Param | Type | Description |
| --- | --- | --- |
| ids | <code>array</code> | The IDs of users to collect the data of. |

<a name="module_database..getSortedPackages"></a>

### database~getSortedPackages(page, dir, method, [themes]) ⇒ <code>object</code>
Takes the page, direction, and sort method returning the raw sql package
data for each. This monolithic function handles trunication of the packages,
and sorting, aiming to provide back the raw data, and allow later functions to
then reconstruct the JSON as needed.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - A server status object containing the results and the pagination object.  

| Param | Type | Default | Description |
| --- | --- | --- | --- |
| page | <code>int</code> |  | Page number. |
| dir | <code>string</code> |  | String flag for asc/desc order. |
| method | <code>string</code> |  | The sort method. |
| [themes] | <code>boolean</code> | <code>false</code> | Optional Parameter to specify if this should only return themes. |

<a name="module_database..getOrderField"></a>

### database~getOrderField(method, sqlStorage) ⇒ <code>object</code> \| <code>null</code>
Internal method to parse the sort method and return the related database field/column.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> \| <code>null</code> - The string field associated to the sort method or null if the method is not recognized.  

| Param | Type | Description |
| --- | --- | --- |
| method | <code>string</code> | The sort method. |
| sqlStorage | <code>object</code> | The database class instance used parse the proper field. |

<a name="module_database..authStoreStateKey"></a>

### database~authStoreStateKey(stateKey) ⇒ <code>object</code>
Gets a state key from login process and saves it on the database.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - A server status object.  

| Param | Type | Description |
| --- | --- | --- |
| stateKey | <code>string</code> | The key code string. |

<a name="module_database..authCheckAndDeleteStateKey"></a>

### database~authCheckAndDeleteStateKey(stateKey, timestamp) ⇒ <code>object</code>
Gets a state key from oauth process and delete it from the database.
It's used to verify if the request for the authentication is valid. The code should be first generated in the
initial stage of the login and then deleted by this function.
If the deletion is successful, the returned record is used to retrieve the created timestamp of the state key
and check if it's not expired (considering a specific timeout).
A custom timestamp can be passed as argument for testing purpose, otherwise the current timestamp is considered.

**Kind**: inner method of [<code>database</code>](#module_database)  
**Returns**: <code>object</code> - A server status object.  

| Param | Type | Description |
| --- | --- | --- |
| stateKey | <code>string</code> | The key code string to delete. |
| timestamp | <code>string</code> | A string in SQL timestamp format to check against the created timestamp of the given state key. If not provided, the current UNIX timestamp is used. |

<a name="module_debug_util"></a>

## debug\_util
A collection of simple functions to help devs debug the application during runtime,
to better assist in tracking down bugs. Since many sets of data cannot be reliably output to the console
this can help to view the transmutations of data as its handled.

<a name="module_debug_util..roughSizeOfObject"></a>

### debug_util~roughSizeOfObject(obj) ⇒ <code>integer</code>
Returns the rough size of the object in memory, in Bytes. Can be used
to help determine how an object changes over time.

**Kind**: inner method of [<code>debug\_util</code>](#module_debug_util)  
**Returns**: <code>integer</code> - Returns the integer value of the object in Bytes.  

| Param | Type | Description |
| --- | --- | --- |
| obj | <code>object</code> | The Object to inspect. |

<a name="module_dev_server"></a>

## dev\_server
The Development initializer of `main.js` as well as managing the startup of a locally created Docker SQL
Server. This uses pg-test to set up a database hosted on local Docker. Migrating all data as needed,
to allow the real server feel, without having access or the risk of the production database. But otherwise runs
the backend API server as normal.


* [dev_server](#module_dev_server)
    * [~dbSetup](#module_dev_server..dbSetup)
    * [~localExterminate(callee, serve, db)](#module_dev_server..localExterminate)

<a name="module_dev_server..dbSetup"></a>

### dev_server~dbSetup
This is the recommended and only way to mock how Jest would use the module.

**Kind**: inner constant of [<code>dev\_server</code>](#module_dev_server)  
<a name="module_dev_server..localExterminate"></a>

### dev_server~localExterminate(callee, serve, db)
Similar to `server.js` exterminate(), except used for the `dev_server.js` instance.

**Kind**: inner method of [<code>dev\_server</code>](#module_dev_server)  

| Param | Type | Description |
| --- | --- | --- |
| callee | <code>string</code> | Simply a way to better log what called the server to shutdown. |
| serve | <code>object</code> | The instance of the ExpressJS `app` that has started listening and can be called to shutdown. |
| db | <code>object</code> | The instance of the `database.js` module, used to properly close its connections during a graceful shutdown. |

<a name="module_logger"></a>

## logger
Allows easy logging of the server. Allowing it to become simple to add additional
logging methods if a log server is ever implemented.


* [logger](#module_logger)
    * [~httpLog(req, res)](#module_logger..httpLog)
    * [~sanitizeLogs(val)](#module_logger..sanitizeLogs) ⇒ <code>string</code>
    * [~generic(lvl, val, [meta])](#module_logger..generic)
    * [~craftError(meta)](#module_logger..craftError) ⇒ <code>string</code>
    * [~craftHttp(meta)](#module_logger..craftHttp) ⇒ <code>string</code>

<a name="module_logger..httpLog"></a>

### logger~httpLog(req, res)
The standard logger for HTTP calls. Logging in a modified 'Apache Combined Log Format'.

**Kind**: inner method of [<code>logger</code>](#module_logger)  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

**Example** *(Logging Output Format)*  
```js
HTTP:: IP [DATE (as ISO String)] "HTTP_METHOD URL PROTOCOL" STATUS_CODE DURATION_OF_REQUESTms
```
<a name="module_logger..sanitizeLogs"></a>

### logger~sanitizeLogs(val) ⇒ <code>string</code>
This function intends to assist in sanitizing values from users that
are input into the logs. Ensuring log forgery does not occur.
And to help ensure that other malicious actions are unable to take place to
admins reviewing the logs.

**Kind**: inner method of [<code>logger</code>](#module_logger)  
**Returns**: <code>string</code> - A sanitized log from the provided value.  
**See**: [https://cwe.mitre.org/data/definitions/117.html](https://cwe.mitre.org/data/definitions/117.html)  

| Param | Type | Description |
| --- | --- | --- |
| val | <code>string</code> | The user provided value to sanitize. |

<a name="module_logger..generic"></a>

### logger~generic(lvl, val, [meta])
A generic logger, that will can accept all types of logs. And from then
create warning, or info logs debending on the Log Level provided.
Additionally the generic logger accepts a meta object argument, to extend
it's logging capabilities, to include system objects, or otherwise unexpected values.
It will have support for certain objects in the meta field to create specific
logs, but otherwise will attempt to display the data provided.

**Kind**: inner method of [<code>logger</code>](#module_logger)  

| Param | Type | Description |
| --- | --- | --- |
| lvl | <code>integer</code> | The Log Level to output. With the following definition. 1 - Fatal 2 - Error 3 - Warning 4 - Information 5 - Debug 6 - Trace |
| val | <code>string</code> | The main information to contain within the log. |
| [meta] | <code>object</code> | An optional Object to include, this object as described above can contain additional information either expected of the log, or that is not natively supported, but will be attempted to display. |

<a name="module_logger..craftError"></a>

### logger~craftError(meta) ⇒ <code>string</code>
Used to help `logger.generic()` build it's logs. Used when type is
specified as `error`.

**Kind**: inner method of [<code>logger</code>](#module_logger)  
**Returns**: <code>string</code> - A crafted string message containing the output of the data
provided.  

| Param | Type | Description |
| --- | --- | --- |
| meta | <code>object</code> | An object containing `err`. |

<a name="module_logger..craftHttp"></a>

### logger~craftHttp(meta) ⇒ <code>string</code>
Used to help `logger.generic()` build it's logs. Used when type is
specified as `http`. Based largely off `logger.httpLog()`

**Kind**: inner method of [<code>logger</code>](#module_logger)  
**Returns**: <code>string</code> - A crafted string message containing the output of the data
provided.  

| Param | Type | Description |
| --- | --- | --- |
| meta | <code>string</code> | An object containing `req`, and `res` |

<a name="module_main"></a>

## main
The Main functionality for the entire server. Sets up the Express server, providing
all endpoints it listens on. With those endpoints being further documented in `api.md`.

<a name="module_query"></a>

## query
Home to parsing all query parameters from the `Request` object. Ensuring a valid response.
While most values will just return their default there are some expecptions:
engine(): Returns false if not defined, to allow a fast way to determine if results need to be pruned.


* [query](#module_query)
    * [~page(req)](#module_query..page) ⇒ <code>number</code>
    * [~sort(req, [def])](#module_query..sort) ⇒ <code>string</code>
    * [~dir(req)](#module_query..dir) ⇒ <code>string</code>
    * [~query(req)](#module_query..query) ⇒ <code>string</code>
    * [~engine(semver)](#module_query..engine) ⇒ <code>string</code> \| <code>boolean</code>
    * [~auth(req)](#module_query..auth) ⇒ <code>string</code>
    * [~repo(req)](#module_query..repo) ⇒ <code>string</code>
    * [~tag(req)](#module_query..tag) ⇒ <code>string</code>
    * [~rename(req)](#module_query..rename) ⇒ <code>boolean</code>
    * [~packageName(req)](#module_query..packageName) ⇒ <code>string</code>
    * [~pathTraversalAttempt(data)](#module_query..pathTraversalAttempt) ⇒ <code>boolean</code>
    * [~login(req)](#module_query..login) ⇒ <code>string</code>

<a name="module_query..page"></a>

### query~page(req) ⇒ <code>number</code>
Parser of the Page query parameter. Defaulting to 1.

**Kind**: inner method of [<code>query</code>](#module_query)  
**Returns**: <code>number</code> - Returns the valid page provided in the query parameter or 1, as the default.  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |

<a name="module_query..sort"></a>

### query~sort(req, [def]) ⇒ <code>string</code>
Parser for the 'sort' query parameter. Defaulting usually to downloads.

**Kind**: inner method of [<code>query</code>](#module_query)  
**Returns**: <code>string</code> - Either the user provided 'sort' query parameter, or the default specified.  

| Param | Type | Default | Description |
| --- | --- | --- | --- |
| req | <code>object</code> |  | The `Request` object inherited from the Express endpoint. |
| [def] | <code>string</code> | <code>&quot;\&quot;downloads\&quot;&quot;</code> | The default provided for sort. Allowing The search function to use "relevance" instead of the default "downloads". |

<a name="module_query..dir"></a>

### query~dir(req) ⇒ <code>string</code>
Parser for either 'direction' or 'order' query parameter, prioritizing
'direction'.

**Kind**: inner method of [<code>query</code>](#module_query)  
**Returns**: <code>string</code> - The valid direction value from the 'direction' or 'order'
query parameter.  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |

<a name="module_query..query"></a>

### query~query(req) ⇒ <code>string</code>
Checks the 'q' query parameter, trunicating it at 50 characters, and checking simplisticly that
it is not a malicious request. Returning "" if an unsafe or invalid query is passed.

**Kind**: inner method of [<code>query</code>](#module_query)  
**Implements**: <code>pathTraversalAttempt</code>  
**Returns**: <code>string</code> - A valid search string derived from 'q' query parameter. Or '' if invalid.  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |

<a name="module_query..engine"></a>

### query~engine(semver) ⇒ <code>string</code> \| <code>boolean</code>
Parses the 'engine' query parameter to ensure it's valid, otherwise returning false.

**Kind**: inner method of [<code>query</code>](#module_query)  
**Returns**: <code>string</code> \| <code>boolean</code> - Returns the valid 'engine' specified, or if none, returns false.  

| Param | Type | Description |
| --- | --- | --- |
| semver | <code>string</code> | The engine string. |

<a name="module_query..auth"></a>

### query~auth(req) ⇒ <code>string</code>
Retrieves Authorization Headers from Request, and Checks for Undefined.

**Kind**: inner method of [<code>query</code>](#module_query)  
**Returns**: <code>string</code> - Returning a valid Authorization Token, or '' if invalid/not found.  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | = The `Request` object inherited from the Express endpoint. |

<a name="module_query..repo"></a>

### query~repo(req) ⇒ <code>string</code>
Parses the 'repository' query parameter, returning it if valid, otherwise returning ''.

**Kind**: inner method of [<code>query</code>](#module_query)  
**Returns**: <code>string</code> - Returning the valid 'repository' query parameter, or '' if invalid.  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |

<a name="module_query..tag"></a>

### query~tag(req) ⇒ <code>string</code>
Parses the 'tag' query parameter, returning it if valid, otherwise returning ''.

**Kind**: inner method of [<code>query</code>](#module_query)  
**Returns**: <code>string</code> - Returns a valid 'tag' query parameter. Or '' if invalid.  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |

<a name="module_query..rename"></a>

### query~rename(req) ⇒ <code>boolean</code>
Since this is intended to be returning a boolean value, returns false
if invalid, otherwise returns true. Checking for mixed captilization.

**Kind**: inner method of [<code>query</code>](#module_query)  
**Returns**: <code>boolean</code> - Returns false if invalid, or otherwise returns the boolean value of the string.  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |

<a name="module_query..packageName"></a>

### query~packageName(req) ⇒ <code>string</code>
This function will convert a user provided package name into a safe format.
It ensures the name is converted to lower case. As is the requirement of all package names.

**Kind**: inner method of [<code>query</code>](#module_query)  
**Returns**: <code>string</code> - Returns the package name in a safe format that can be worked with further.  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` Object inherited from the Express endpoint. |

<a name="module_query..pathTraversalAttempt"></a>

### query~pathTraversalAttempt(data) ⇒ <code>boolean</code>
Completes some short checks to determine if the data contains a malicious
path traversal attempt. Returning a boolean indicating if a path traversal attempt
exists in the data.

**Kind**: inner method of [<code>query</code>](#module_query)  
**Returns**: <code>boolean</code> - True indicates a path traversal attempt was found. False otherwise.  

| Param | Type | Description |
| --- | --- | --- |
| data | <code>string</code> | The data to check for possible malicious data. |

<a name="module_query..login"></a>

### query~login(req) ⇒ <code>string</code>
Returns the User from the URL Path, otherwise ''

**Kind**: inner method of [<code>query</code>](#module_query)  
**Returns**: <code>string</code> - Returns a valid specified user or ''.  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |

<a name="module_server"></a>

## server
The initializer of `main.js` starting up the Express Server, and setting the port
to listen on. As well as handling a graceful shutdown of the server.

<a name="module_server..exterminate"></a>

### server~exterminate(callee)
This is called when the server process receives a `SIGINT` or `SIGTERM` signal.
Which this will then handle closing the server listener, as well as calling `data.Shutdown`.

**Kind**: inner method of [<code>server</code>](#module_server)  

| Param | Type | Description |
| --- | --- | --- |
| callee | <code>string</code> | Simply a way to better log what called the server to shutdown. |

<a name="module_storage"></a>

## storage
This module is the second generation of data storage methodology,
in which this provides static access to files stored within regular cloud
file storage. Specifically intended for use with Google Cloud Storage.


* [storage](#module_storage)
    * [~setupGCS()](#module_storage..setupGCS) ⇒ <code>object</code>
    * [~getBanList()](#module_storage..getBanList) ⇒ <code>Array</code>
    * [~getFeaturedPackages()](#module_storage..getFeaturedPackages) ⇒ <code>Array</code>
    * [~getFeaturedThemes()](#module_storage..getFeaturedThemes) ⇒ <code>Array</code>

<a name="module_storage..setupGCS"></a>

### storage~setupGCS() ⇒ <code>object</code>
Sets up the Google Cloud Storage Class, to ensure its ready to use.

**Kind**: inner method of [<code>storage</code>](#module_storage)  
**Returns**: <code>object</code> - - A new Google Cloud Storage instance.  
<a name="module_storage..getBanList"></a>

### storage~getBanList() ⇒ <code>Array</code>
Reads the ban list from the Google Cloud Storage Space.
Returning the cached parsed JSON object.
If it has been read before during this instance of hosting just the cached
version is returned.

**Kind**: inner method of [<code>storage</code>](#module_storage)  
**Returns**: <code>Array</code> - Parsed JSON Array of all Banned Packages.  
<a name="module_storage..getFeaturedPackages"></a>

### storage~getFeaturedPackages() ⇒ <code>Array</code>
Returns the hardcoded featured packages file from Google Cloud Storage.
Caching the object once read for this instance of the server run.

**Kind**: inner method of [<code>storage</code>](#module_storage)  
**Returns**: <code>Array</code> - Parsed JSON Array of all Featured Packages.  
<a name="module_storage..getFeaturedThemes"></a>

### storage~getFeaturedThemes() ⇒ <code>Array</code>
Used to retrieve Google Cloud Storage Object for featured themes.

**Kind**: inner method of [<code>storage</code>](#module_storage)  
**Returns**: <code>Array</code> - JSON Parsed Array of Featured Theme Names.  
<a name="module_utils"></a>

## utils
A helper for any functions that are agnostic in handlers.


* [utils](#module_utils)
    * [~isPackageNameBanned(name)](#module_utils..isPackageNameBanned) ⇒ <code>object</code>
    * [~constructPackageObjectFull(pack)](#module_utils..constructPackageObjectFull) ⇒ <code>object</code>
    * [~constructPackageObjectShort(pack)](#module_utils..constructPackageObjectShort) ⇒ <code>object</code> \| <code>array</code>
    * [~constructPackageObjectJSON(pack)](#module_utils..constructPackageObjectJSON) ⇒ <code>object</code>
    * [~engineFilter()](#module_utils..engineFilter) ⇒ <code>object</code>
    * [~semverArray(semver)](#module_utils..semverArray) ⇒ <code>array</code> \| <code>null</code>
    * [~semverGt(a1, a2)](#module_utils..semverGt) ⇒ <code>boolean</code>
    * [~semverLt(a1, a2)](#module_utils..semverLt) ⇒ <code>boolean</code>
    * [~getOwnerRepoFromPackage(pack)](#module_utils..getOwnerRepoFromPackage) ⇒ <code>string</code>
    * [~getOwnerRepoFromUrlString(url)](#module_utils..getOwnerRepoFromUrlString) ⇒ <code>string</code>
    * [~semverEq(a1, a2)](#module_utils..semverEq) ⇒ <code>boolean</code>
    * [~generateRandomString(n)](#module_utils..generateRandomString) ⇒ <code>string</code>

<a name="module_utils..isPackageNameBanned"></a>

### utils~isPackageNameBanned(name) ⇒ <code>object</code>
This uses the `storage.js` to retrieve a banlist. And then simply
iterates through the banList array, until it finds a match to the name
it was given. If no match is found then it returns false.

**Kind**: inner method of [<code>utils</code>](#module_utils)  
**Returns**: <code>object</code> - Returns Server Status Object with ok as true if blocked,
false otherwise.  

| Param | Type | Description |
| --- | --- | --- |
| name | <code>string</code> | The name of the package to check if it is banned. |

<a name="module_utils..constructPackageObjectFull"></a>

### utils~constructPackageObjectFull(pack) ⇒ <code>object</code>
Takes the raw return of a full row from database.getPackageByName() and
constructs a standardized package object full from it.
This should be called only on the data provided by database.getPackageByName(),
otherwise the behavior is unexpected.

**Kind**: inner method of [<code>utils</code>](#module_utils)  
**Returns**: <code>object</code> - A properly formatted and converted Package Object Full.  
**See**

- [https://github.com/confused-Techie/atom-backend/blob/main/docs/returns.md#package-object-full](https://github.com/confused-Techie/atom-backend/blob/main/docs/returns.md#package-object-full)
- [https://github.com/confused-Techie/atom-backend/blob/main/docs/queries.md#retrieve-single-package--package-object-full](https://github.com/confused-Techie/atom-backend/blob/main/docs/queries.md#retrieve-single-package--package-object-full)


| Param | Type | Description |
| --- | --- | --- |
| pack | <code>object</code> | The anticipated raw SQL return that contains all data to construct a Package Object Full. |

<a name="module_utils..constructPackageObjectShort"></a>

### utils~constructPackageObjectShort(pack) ⇒ <code>object</code> \| <code>array</code>
Takes a single or array of rows from the db, and returns a JSON
construction of package object shorts

**Kind**: inner method of [<code>utils</code>](#module_utils)  
**Returns**: <code>object</code> \| <code>array</code> - A properly formatted and converted Package Object Short.  
**See**

- [https://github.com/confused-Techie/atom-backend/blob/main/docs/returns.md#package-object-short](https://github.com/confused-Techie/atom-backend/blob/main/docs/returns.md#package-object-short)
- [https://github.com/confused-Techie/atom-backend/blob/main/docs/queries.md#retrieve-many-sorted-packages--package-object-short](https://github.com/confused-Techie/atom-backend/blob/main/docs/queries.md#retrieve-many-sorted-packages--package-object-short)


| Param | Type | Description |
| --- | --- | --- |
| pack | <code>object</code> | The anticipated raw SQL return that contains all data to construct a Package Object Short. |

<a name="module_utils..constructPackageObjectJSON"></a>

### utils~constructPackageObjectJSON(pack) ⇒ <code>object</code>
Takes the return of getPackageVersionByNameAndVersion and returns
a recreation of the package.json with a modified dist.tarball key, pointing
to this server for download.

**Kind**: inner method of [<code>utils</code>](#module_utils)  
**Returns**: <code>object</code> - A properly formatted Package Object Mini.  
**See**: [https://github.com/confused-Techie/atom-backend/blob/main/docs/returns.md#package-object-mini](https://github.com/confused-Techie/atom-backend/blob/main/docs/returns.md#package-object-mini)  

| Param | Type | Description |
| --- | --- | --- |
| pack | <code>object</code> | The expected raw SQL return of `getPackageVersionByNameAndVersion` |

<a name="module_utils..engineFilter"></a>

### utils~engineFilter() ⇒ <code>object</code>
A complex function that provides filtering by Atom engine version.
This should take a package with it's versions and retrieve whatever matches
that engine version as provided.

**Kind**: inner method of [<code>utils</code>](#module_utils)  
**Returns**: <code>object</code> - The filtered object.  
<a name="module_utils..semverArray"></a>

### utils~semverArray(semver) ⇒ <code>array</code> \| <code>null</code>
Takes a semver string and returns it as an Array of strings.
This can also be used to check for semver valitidy. If it's not a semver, null is returned.

**Kind**: inner method of [<code>utils</code>](#module_utils)  
**Returns**: <code>array</code> \| <code>null</code> - The formatted semver in array of three strings, or null if no match.  

| Param | Type |
| --- | --- |
| semver | <code>string</code> | 

**Example** *(Valid Semver Passed)*  
```js
// returns ["1", "2", "3" ]
semverArray("1.2.3");
```
**Example** *(Invalid Semver Passed)*  
```js
// returns null
semverArray("1.Hello.World");
```
<a name="module_utils..semverGt"></a>

### utils~semverGt(a1, a2) ⇒ <code>boolean</code>
Compares two sermver and return true if the first is greater than the second.
Expects to get the semver formatted as array of strings.
Should be always executed after running semverArray.

**Kind**: inner method of [<code>utils</code>](#module_utils)  
**Returns**: <code>boolean</code> - The result of the comparison  

| Param | Type | Description |
| --- | --- | --- |
| a1 | <code>array</code> | First semver as array of strings. |
| a2 | <code>array</code> | Second semver as array of string. |

<a name="module_utils..semverLt"></a>

### utils~semverLt(a1, a2) ⇒ <code>boolean</code>
Compares two sermver and return true if the first is less than the second.
Expects to get the semver formatted as array of strings.
Should be always executed after running semverArray.

**Kind**: inner method of [<code>utils</code>](#module_utils)  
**Returns**: <code>boolean</code> - The result of the comparison  

| Param | Type | Description |
| --- | --- | --- |
| a1 | <code>array</code> | First semver as array of strings. |
| a2 | <code>array</code> | Second semver as array of strings. |

<a name="module_utils..getOwnerRepoFromPackage"></a>

### utils~getOwnerRepoFromPackage(pack) ⇒ <code>string</code>
A function that takes a package and tries to extract `owner/repo` string from it
relying on getOwnerRepoFromUrlString util.

**Kind**: inner method of [<code>utils</code>](#module_utils)  
**Returns**: <code>string</code> - The `owner/repo` string from the URL. Or an empty string if unable to parse.  

| Param | Type | Description |
| --- | --- | --- |
| pack | <code>object</code> | The Github package. |

<a name="module_utils..getOwnerRepoFromUrlString"></a>

### utils~getOwnerRepoFromUrlString(url) ⇒ <code>string</code>
A function that takes the URL string of a GitHub repo and return the `owner/repo`
string for the repo. Intended to be used from a packages entry `data.repository.url`

**Kind**: inner method of [<code>utils</code>](#module_utils)  
**Returns**: <code>string</code> - The `owner/repo` string from the URL. Or an empty string if unable to parse.  

| Param | Type | Description |
| --- | --- | --- |
| url | <code>string</code> | The URL for the Repo. |

<a name="module_utils..semverEq"></a>

### utils~semverEq(a1, a2) ⇒ <code>boolean</code>
Compares two sermver and return true if the first is equal to the second.
Expects to get the semver formatted as array of strings.
Should be always executed after running semverArray.

**Kind**: inner method of [<code>utils</code>](#module_utils)  
**Returns**: <code>boolean</code> - The result of the comparison.  

| Param | Type | Description |
| --- | --- | --- |
| a1 | <code>array</code> | First semver as array. |
| a2 | <code>array</code> | Second semver as array. |

<a name="module_utils..generateRandomString"></a>

### utils~generateRandomString(n) ⇒ <code>string</code>
Uses the crypto module to generate and return a random string.

**Kind**: inner method of [<code>utils</code>](#module_utils)  
**Returns**: <code>string</code> - A string exported from the generated Buffer using the "hex" format (encode
each byte as two hexadecimal characters).  

| Param | Type | Description |
| --- | --- | --- |
| n | <code>string</code> | The number of bytes to generate. |

<a name="module_vcs"></a>

## vcs
This Module is intended to be the platform agnostic tool to interaction
with Version Control Systems of different types in the cloud.
To collect data from them, format it accordingly ang return it to the requesting
function.


* [vcs](#module_vcs)
    * [~ownership(userObj, packObj, [opts])](#module_vcs..ownership) ⇒ <code>object</code>
    * [~newPackageData(userObj, ownerRepo, service)](#module_vcs..newPackageData) ⇒ <code>object</code>
    * [~newVersionData(userObj, ownerRepo, service)](#module_vcs..newVersionData) ⇒ [<code>SSO\_VCS\_newVersionData</code>](#SSO_VCS_newVersionData)
    * [~determineProvider(repo)](#module_vcs..determineProvider) ⇒ <code>object</code>

<a name="module_vcs..ownership"></a>

### vcs~ownership(userObj, packObj, [opts]) ⇒ <code>object</code>
Allows the ability to check if a user has permissions to write to a repo.
<b>MUST</b> be provided the full `user` and `package` objects here to account
for possible situations. This allows any new handling that's needed to be defined
here rather than in multiple locations throughout the codebase.
Returns `ok: true` where content is the repo data from the service provider on
success, returns `ok: false` if they do not have access to said repo, with
specificity available within the `short` key.

**Kind**: inner method of [<code>vcs</code>](#module_vcs)  
**Returns**: <code>object</code> - - A Server Status object containing the role of the user according
to the repo or otherwise a failure.  

| Param | Type | Description |
| --- | --- | --- |
| userObj | <code>object</code> | The Full User Object, as returned by the backend, and appended to with authorization data. |
| packObj | <code>object</code> \| <code>string</code> | The full Package objects data from the backend. Although, can also contain a string, this string would directly be an Owner/Repo combo, but it is recommended to use the Package Object when possible. The string variant is intended to be used when first publishing a package, and there is no package object to use. |
| [opts] | <code>object</code> | An optional configuration object, that allows the definition of non-standard options to change the fucntionality of this function. `opts` can accept the following parameters:  - dev_override: {boolean} - Wether to enable or disable the dev_override. Disabled    by default, this dangerous boolean is inteded to be used during tests that    overrides the default safe static returns, and lets the function run as intended    in development mode. |

<a name="module_vcs..newPackageData"></a>

### vcs~newPackageData(userObj, ownerRepo, service) ⇒ <code>object</code>
Replaces the previous git.createPackage().
Intended to retreive the full packages data. The data which will contain
all information needed to create a new package entry onto the DB.

**Kind**: inner method of [<code>vcs</code>](#module_vcs)  
**Returns**: <code>object</code> - - Returns a Server Status Object, which when `ok: true`
Contains the full package data. This includes the Readme, the package.json, and all version data.  
**Todo**

- [ ] Stop hardcoding the service that is passed here.


| Param | Type | Description |
| --- | --- | --- |
| userObj | <code>object</code> | The Full User Object as returned by auth.verifyAuth() |
| ownerRepo | <code>string</code> | The Owner Repo Combo for the package such as `pulsar-edit/pulsar` |
| service | <code>string</code> | The Service this package is intended for. Matching a valid return type from `vcs.determineProvider()` Eventually this service will be detected by the package handler or moved here, but for now is intended to be hardcoded as "git" |

<a name="module_vcs..newVersionData"></a>

### vcs~newVersionData(userObj, ownerRepo, service) ⇒ [<code>SSO\_VCS\_newVersionData</code>](#SSO_VCS_newVersionData)
Replaces the previously used `git.metadataAppendTarballInfo()`
Intended to retreive the most basic of a package's data.
Bundles all the special handling of crafting such an object into this single
function to reduce usage elsewhere.

**Kind**: inner method of [<code>vcs</code>](#module_vcs)  
**Returns**: [<code>SSO\_VCS\_newVersionData</code>](#SSO_VCS_newVersionData) - A Server Status Object, which when `ok: true`
returns all data that would be needed to update a package on the DB, and
upload a new version.  

| Param | Type | Description |
| --- | --- | --- |
| userObj | <code>object</code> | The Full User Object as returned by `auth.verifyAuth()` |
| ownerRepo | <code>string</code> | The Owner Repo Combo of the package affected. Such as `pulsar-edit/pulsar` |
| service | <code>string</code> | The service to use as expected to be returned by `vcs.determineProvider()`. Currently should be hardcoded to "git" |

<a name="module_vcs..determineProvider"></a>

### vcs~determineProvider(repo) ⇒ <code>object</code>
Determines the repostiry object by the given argument.
Takes the `repository` key of a `package.json` and with very little if not no
desctructing will attempt to locate the provider service and return an object
with it.

**Kind**: inner method of [<code>vcs</code>](#module_vcs)  
**Returns**: <code>object</code> - The object related to the package repository type.  

| Param | Type | Description |
| --- | --- | --- |
| repo | <code>string</code> \| <code>object</code> | The `repository` of the retrieved package. |

<a name="module_common_handler"></a>

## common\_handler
Provides a simplistic way to refer to implement common endpoint returns.
So these can be called as an async function without more complex functions, reducing
verbosity, and duplication within the codebase.

**Implements**: <code>logger</code>  

* [common_handler](#module_common_handler)
    * [~handleError(req, res, obj)](#module_common_handler..handleError)
    * [~authFail(req, res, user)](#module_common_handler..authFail)
    * [~serverError(req, res, err)](#module_common_handler..serverError)
    * [~notFound(req, res)](#module_common_handler..notFound)
    * [~notSupported(req, res)](#module_common_handler..notSupported)
    * [~siteWideNotFound(req, res)](#module_common_handler..siteWideNotFound)
    * [~badRepoJSON(req, res)](#module_common_handler..badRepoJSON)
    * [~badPackageJSON(req, res)](#module_common_handler..badPackageJSON)
    * [~packageExists(req, res)](#module_common_handler..packageExists)
    * [~missingAuthJSON(req, res)](#module_common_handler..missingAuthJSON)

<a name="module_common_handler..handleError"></a>

### common_handler~handleError(req, res, obj)
Generic error handler mostly used to reduce the duplication of error handling in other modules.
It checks the short error string and calls the relative endpoint.
Note that it's designed to be called as the last async function before the return.

**Kind**: inner method of [<code>common\_handler</code>](#module_common_handler)  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |
| obj | <code>object</code> | the Raw Status Object of the User, expected to return from `VerifyAuth`. |

<a name="module_common_handler..authFail"></a>

### common_handler~authFail(req, res, user)
Will take the <b>failed</b> user object from VerifyAuth, and respond for the endpoint as
either a "Server Error" or a "Bad Auth", whichever is correct based on the Error bubbled from VerifyAuth.

**Kind**: inner method of [<code>common\_handler</code>](#module_common_handler)  
**Implements**: <code>MissingAuthJSON</code>, <code>ServerErrorJSON</code>, <code>logger.HTTPLog</code>  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |
| user | <code>object</code> | The Raw Status Object of the User, expected to return from `VerifyAuth`. |

<a name="module_common_handler..serverError"></a>

### common_handler~serverError(req, res, err)
Returns a standard Server Error to the user as JSON. Logging the detailed error message to the server.
###### Setting:
* Status Code: 500
* JSON Response Body: message: "Application Error"

**Kind**: inner method of [<code>common\_handler</code>](#module_common_handler)  
**Implements**: <code>logger.HTTPLog</code>, <code>logger.generic</code>  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |
| err | <code>string</code> | The detailed error message to log server side. |

<a name="module_common_handler..notFound"></a>

### common_handler~notFound(req, res)
Standard endpoint to return the JSON Not Found error to the user.
###### Setting:
* Status Code: 404
* JSON Respone Body: message: "Not Found"

**Kind**: inner method of [<code>common\_handler</code>](#module_common_handler)  
**Implements**: <code>logger.HTTPLog</code>  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

<a name="module_common_handler..notSupported"></a>

### common_handler~notSupported(req, res)
Returns a Not Supported message to the user.
###### Setting:
* Status Code: 501
* JSON Response Body: message: "While under development this feature is not supported."

**Kind**: inner method of [<code>common\_handler</code>](#module_common_handler)  
**Implements**: <code>logger.HTTPLog</code>  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

<a name="module_common_handler..siteWideNotFound"></a>

### common_handler~siteWideNotFound(req, res)
Returns the SiteWide 404 page to the end user.
###### Setting Currently:
* Status Code: 404
* JSON Response Body: message: "This is a standin for the proper site wide 404 page."

**Kind**: inner method of [<code>common\_handler</code>](#module_common_handler)  
**Implements**: <code>logger.HTTPLog</code>  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

<a name="module_common_handler..badRepoJSON"></a>

### common_handler~badRepoJSON(req, res)
Returns the BadRepoJSON message to the user.
###### Setting:
* Status Code: 400
* JSON Response Body: message: That repo does not exist, isn't an atom package, or atombot does not have access.

**Kind**: inner method of [<code>common\_handler</code>](#module_common_handler)  
**Implements**: <code>logger.HTTPLog</code>  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

<a name="module_common_handler..badPackageJSON"></a>

### common_handler~badPackageJSON(req, res)
Returns the BadPackageJSON message to the user.
###### Setting:
* Status Code: 400
* JSON Response Body: message: The package.json at owner/repo isn't valid.

**Kind**: inner method of [<code>common\_handler</code>](#module_common_handler)  
**Implements**: <code>logger.HTTPLog</code>  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

<a name="module_common_handler..packageExists"></a>

### common_handler~packageExists(req, res)
Returns the PackageExist message to the user.
###### Setting:
* Status Code: 409
* JSON Response Body: message: "A Package by that name already exists."

**Kind**: inner method of [<code>common\_handler</code>](#module_common_handler)  
**Implements**: <code>logger.HTTPLog</code>  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

<a name="module_common_handler..missingAuthJSON"></a>

### common_handler~missingAuthJSON(req, res)
Returns the MissingAuth message to the user.
###### Setting:
* Status Code: 401
* JSON Response Body: message: "Requires authentication. Please update your token if you haven't done so recently."

**Kind**: inner method of [<code>common\_handler</code>](#module_common_handler)  
**Implements**: <code>logger.HTTPLog</code>  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

<a name="module_oauth_handler"></a>

## oauth\_handler
Endpoint Handlers for Authentication URLs

**Implements**: <code>config</code>, <code>common\_handler</code>  

* [oauth_handler](#module_oauth_handler)
    * [~getLogin(req, res)](#module_oauth_handler..getLogin)
    * [~getOauth(req, res)](#module_oauth_handler..getOauth)
    * [~getPat(req, res)](#module_oauth_handler..getPat)

<a name="module_oauth_handler..getLogin"></a>

### oauth_handler~getLogin(req, res)
Endpoint used to redirect users to login. Users will reach GitHub OAuth Page
based on the backends client id. A key from crypto module is retrieved and used as
state parameter for GH authentication.

**Kind**: inner method of [<code>oauth\_handler</code>](#module_oauth_handler)  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

**Properties**

| Type | Description |
| --- | --- |
| <code>http\_method</code> | GET |
| <code>http\_endpoint</code> | /api/lgoin |

<a name="module_oauth_handler..getOauth"></a>

### oauth_handler~getOauth(req, res)
Endpoint intended to use as the actual return from GitHub to login.

**Kind**: inner method of [<code>oauth\_handler</code>](#module_oauth_handler)  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

**Properties**

| Type | Description |
| --- | --- |
| <code>http\_method</code> | GET |
| <code>http\_endpoint</code> | /api/oath |

<a name="module_oauth_handler..getPat"></a>

### oauth_handler~getPat(req, res)
Endpoint intended to Allow users to sign up with a Pat Token.

**Kind**: inner method of [<code>oauth\_handler</code>](#module_oauth_handler)  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

**Properties**

| Type | Description |
| --- | --- |
| <code>http\_method</code> | GET |
| <code>http\_endpoint</code> | /api/pat |

<a name="module_package_handler"></a>

## package\_handler
Endpoint Handlers in all relating to the packages themselves.

**Implements**: <code>common\_handler</code>, <code>users</code>, <code>data</code>, <code>query</code>, <code>git</code>, <code>logger</code>, <code>error</code>, <code>config</code>  

* [package_handler](#module_package_handler)
    * [~getPackages(req, res)](#module_package_handler..getPackages)
    * [~postPackages(req, res)](#module_package_handler..postPackages) ⇒ <code>string</code>
    * [~getPackagesFeatured(req, res)](#module_package_handler..getPackagesFeatured)
    * [~getPackagesSearch(req, res)](#module_package_handler..getPackagesSearch)
    * [~getPackagesDetails(req, res)](#module_package_handler..getPackagesDetails)
    * [~deletePackagesName(req, res)](#module_package_handler..deletePackagesName)
    * [~postPackagesStar(req, res)](#module_package_handler..postPackagesStar)
    * [~deletePackageStar(req, res)](#module_package_handler..deletePackageStar)
    * [~getPackagesStargazers(req, res)](#module_package_handler..getPackagesStargazers)
    * [~postPackagesVersion(req, res)](#module_package_handler..postPackagesVersion)
    * [~getPackagesVersion(req, res)](#module_package_handler..getPackagesVersion)
    * [~getPackagesVersionTarball(req, res)](#module_package_handler..getPackagesVersionTarball)
    * [~deletePackageVersion(req, res)](#module_package_handler..deletePackageVersion)
    * [~postPackagesEventUninstall(req, res)](#module_package_handler..postPackagesEventUninstall)

<a name="module_package_handler..getPackages"></a>

### package_handler~getPackages(req, res)
Endpoint to return all packages to the user. Based on any filtering
theyved applied via query parameters.

**Kind**: inner method of [<code>package\_handler</code>](#module_package_handler)  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

**Properties**

| Type | Description |
| --- | --- |
| <code>http\_method</code> | GET |
| <code>http\_endpoint</code> | /api/packages |

<a name="module_package_handler..postPackages"></a>

### package_handler~postPackages(req, res) ⇒ <code>string</code>
This endpoint is used to publish a new package to the backend server.
Taking the repo, and your authentication for it, determines if it can be published,
then goes about doing so.

**Kind**: inner method of [<code>package\_handler</code>](#module_package_handler)  
**Returns**: <code>string</code> - JSON object of new data pushed into the database, but stripped of
sensitive informations like primary and foreign keys.  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

**Properties**

| Type | Description |
| --- | --- |
| <code>http\_method</code> | POST |
| <code>http\_endpoint</code> | /api/packages |

<a name="module_package_handler..getPackagesFeatured"></a>

### package_handler~getPackagesFeatured(req, res)
Allows the user to retrieve the featured packages, as package object shorts.
This endpoint was originally undocumented. The decision to return 200 is based off similar endpoints.
Additionally for the time being this list is created manually, the same method used
on Atom.io for now. Although there are plans to have this become automatic later on.

**Kind**: inner method of [<code>package\_handler</code>](#module_package_handler)  
**See**

- [Source Code](https://github.com/atom/apm/blob/master/src/featured.coffee)
- [Discussion](https://github.com/confused-Techie/atom-community-server-backend-JS/issues/23)


| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

**Properties**

| Type | Description |
| --- | --- |
| <code>http\_method</code> | GET |
| <code>http\_endpoint</code> | /api/packages/featured |

<a name="module_package_handler..getPackagesSearch"></a>

### package_handler~getPackagesSearch(req, res)
Allows user to search through all packages. Using their specified
query parameter.

**Kind**: inner method of [<code>package\_handler</code>](#module_package_handler)  
**Todo**

- [ ] Note: This **has** been migrated to the new DB, and is fully functional.
The TODO here is to eventually move this to use the custom built in LCS search,
rather than simple search.


| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

**Properties**

| Type | Description |
| --- | --- |
| <code>http\_method</code> | GET |
| <code>http\_endpoint</code> | /api/packages/search |

<a name="module_package_handler..getPackagesDetails"></a>

### package_handler~getPackagesDetails(req, res)
Allows the user to request a single package object full, depending
on the package included in the path parameter.

**Kind**: inner method of [<code>package\_handler</code>](#module_package_handler)  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

**Properties**

| Type | Description |
| --- | --- |
| <code>http\_method</code> | GET |
| <code>http\_endpoint</code> | /api/packages/:packageName |

<a name="module_package_handler..deletePackagesName"></a>

### package_handler~deletePackagesName(req, res)
Allows the user to delete a repo they have ownership of.

**Kind**: inner method of [<code>package\_handler</code>](#module_package_handler)  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

**Properties**

| Type | Description |
| --- | --- |
| <code>http\_method</code> | DELETE |
| <code>http\_endpoint</code> | /api/packages/:packageName |

<a name="module_package_handler..postPackagesStar"></a>

### package_handler~postPackagesStar(req, res)
Used to submit a new star to a package from the authenticated user.

**Kind**: inner method of [<code>package\_handler</code>](#module_package_handler)  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

**Properties**

| Type | Description |
| --- | --- |
| <code>http\_method</code> | POST |
| <code>http\_endpoint</code> | /api/packages/:packageName/star |

<a name="module_package_handler..deletePackageStar"></a>

### package_handler~deletePackageStar(req, res)
Used to remove a star from a specific package for the authenticated usesr.

**Kind**: inner method of [<code>package\_handler</code>](#module_package_handler)  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

**Properties**

| Type | Description |
| --- | --- |
| <code>http\_method</code> | DELETE |
| <code>http\_endpoint</code> | /api/packages/:packageName/star |

<a name="module_package_handler..getPackagesStargazers"></a>

### package_handler~getPackagesStargazers(req, res)
Endpoint returns the array of `star_gazers` from a specified package.
Taking only the package wanted, and returning it directly.

**Kind**: inner method of [<code>package\_handler</code>](#module_package_handler)  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

**Properties**

| Type | Description |
| --- | --- |
| <code>http\_method</code> | GET |
| <code>http\_endpoint</code> | /api/packages/:packageName/stargazers |

<a name="module_package_handler..postPackagesVersion"></a>

### package_handler~postPackagesVersion(req, res)
Allows a new version of a package to be published. But also can allow
a user to rename their application during this process.

**Kind**: inner method of [<code>package\_handler</code>](#module_package_handler)  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

**Properties**

| Type | Description |
| --- | --- |
| <code>http\_method</code> | POST |
| <code>http\_endpoint</code> | /api/packages/:packageName/versions |

<a name="module_package_handler..getPackagesVersion"></a>

### package_handler~getPackagesVersion(req, res)
Used to retrieve a specific version from a package.

**Kind**: inner method of [<code>package\_handler</code>](#module_package_handler)  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

**Properties**

| Type | Description |
| --- | --- |
| <code>http\_method</code> | GET |
| <code>http\_endpoint</code> | /api/packages/:packageName/versions/:versionName |

<a name="module_package_handler..getPackagesVersionTarball"></a>

### package_handler~getPackagesVersionTarball(req, res)
Allows the user to get the tarball for a specific package version.
Which should initiate a download of said tarball on their end.

**Kind**: inner method of [<code>package\_handler</code>](#module_package_handler)  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

**Properties**

| Type | Description |
| --- | --- |
| <code>http\_method</code> | GET |
| <code>http\_endpoint</code> | /api/packages/:packageName/versions/:versionName/tarball |

<a name="module_package_handler..deletePackageVersion"></a>

### package_handler~deletePackageVersion(req, res)
Allows a user to delete a specific version of their package.

**Kind**: inner method of [<code>package\_handler</code>](#module_package_handler)  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

**Properties**

| Type | Description |
| --- | --- |
| <code>http\_method</code> | DELETE |
| <code>http\_endpoint</code> | /api/packages/:packageName/versions/:versionName |

<a name="module_package_handler..postPackagesEventUninstall"></a>

### package_handler~postPackagesEventUninstall(req, res)
Used when a package is uninstalled, decreases the download count by 1.
And saves this data, Originally an undocumented endpoint.
The decision to return a '201' was based on how other POST endpoints return,
during a successful event.

**Kind**: inner method of [<code>package\_handler</code>](#module_package_handler)  
**See**: [https://github.com/atom/apm/blob/master/src/uninstall.coffee](https://github.com/atom/apm/blob/master/src/uninstall.coffee)  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

**Properties**

| Type | Description |
| --- | --- |
| <code>http\_method</code> | POST |
| <code>http\_endpoint</code> | /api/packages/:packageName/versions/:versionName/events/uninstall |

<a name="module_star_handler"></a>

## star\_handler
Handler for any endpoints whose slug after `/api/` is `star`.

<a name="module_star_handler..getStars"></a>

### star_handler~getStars(req, res)
Endpoint for `GET /api/stars`. Whose endgoal is to return an array of all packages
the authenticated user has stared.

**Kind**: inner method of [<code>star\_handler</code>](#module_star_handler)  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

**Properties**

| Type | Description |
| --- | --- |
| <code>http\_method</code> | GET |
| <code>http\_endpoint</code> | /api/stars |

<a name="module_theme_handler"></a>

## theme\_handler
Endpoint Handlers relating to themes only.

**Implements**: <code>command\_handler</code>, <code>database</code>, <code>utils</code>, <code>logger</code>  

* [theme_handler](#module_theme_handler)
    * [~getThemeFeatured(req, res)](#module_theme_handler..getThemeFeatured)
    * [~getThemes(req, res)](#module_theme_handler..getThemes)
    * [~getThemesSearch(req, res)](#module_theme_handler..getThemesSearch)

<a name="module_theme_handler..getThemeFeatured"></a>

### theme_handler~getThemeFeatured(req, res)
Used to retrieve all Featured Packages that are Themes. Originally an undocumented
endpoint. Returns a 200 response based on other similar responses.
Additionally for the time being this list is created manually, the same method used
on Atom.io for now. Although there are plans to have this become automatic later on.

**Kind**: inner method of [<code>theme\_handler</code>](#module_theme_handler)  
**See**

- [Source Code](https://github.com/atom/apm/blob/master/src/featured.coffee)
- [Discussion](https://github.com/confused-Techie/atom-community-server-backend-JS/issues/23)


| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

**Properties**

| Type | Description |
| --- | --- |
| <code>http\_method</code> | GET |
| <code>http\_endpoint</code> | /api/themes/featured |

<a name="module_theme_handler..getThemes"></a>

### theme_handler~getThemes(req, res)
Endpoint to return all Themes to the user. Based on any filtering
they'ved applied via query parameters.

**Kind**: inner method of [<code>theme\_handler</code>](#module_theme_handler)  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

**Properties**

| Type | Description |
| --- | --- |
| <code>http\_method</code> | GET |
| <code>http\_endpoint</code> | /api/themes |

<a name="module_theme_handler..getThemesSearch"></a>

### theme_handler~getThemesSearch(req, res)
Endpoint to Search from all themes on the registry.

**Kind**: inner method of [<code>theme\_handler</code>](#module_theme_handler)  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

**Properties**

| Type | Description |
| --- | --- |
| <code>http\_method</code> | GET |
| <code>http\_endpoint</code> | /api/themes/search |

<a name="module_update_handler"></a>

## update\_handler
Endpoint Handlers relating to updating the editor.

**Implments**: <code>command\_handler</code>  
<a name="module_update_handler..getUpdates"></a>

### update_handler~getUpdates(req, res)
Used to retrieve new editor update information.

**Kind**: inner method of [<code>update\_handler</code>](#module_update_handler)  
**Todo**

- [ ] This function has never been implemented on this system. Since there is currently no
update methodology.


| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

**Properties**

| Type | Description |
| --- | --- |
| <code>http\_method</code> | GET |
| <code>http\_endpoint</code> | /api/updates |

<a name="module_user_handler"></a>

## user\_handler
Handler for endpoints whose slug after `/api/` is `user`.


* [user_handler](#module_user_handler)
    * [~getLoginStars(req, res)](#module_user_handler..getLoginStars)
    * [~getAuthUser(req, res)](#module_user_handler..getAuthUser)
    * [~getUser(req, res)](#module_user_handler..getUser)

<a name="module_user_handler..getLoginStars"></a>

### user_handler~getLoginStars(req, res)
Endpoint that returns another users Star Gazers List.

**Kind**: inner method of [<code>user\_handler</code>](#module_user_handler)  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

**Properties**

| Type | Description |
| --- | --- |
| <code>http\_method</code> | GET |
| <code>http\_endpoint</code> | /api/users/:login/stars |

<a name="module_user_handler..getAuthUser"></a>

### user_handler~getAuthUser(req, res)
Endpoint that returns the currently authenticated Users User Details

**Kind**: inner method of [<code>user\_handler</code>](#module_user_handler)  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

**Properties**

| Type | Description |
| --- | --- |
| <code>http\_method</code> | GET |
| <code>http\_endpoint</code> | /api/users |

<a name="module_user_handler..getUser"></a>

### user_handler~getUser(req, res)
Endpoint that returns the user account details of another user. Including all packages
published.

**Kind**: inner method of [<code>user\_handler</code>](#module_user_handler)  

| Param | Type | Description |
| --- | --- | --- |
| req | <code>object</code> | The `Request` object inherited from the Express endpoint. |
| res | <code>object</code> | The `Response` object inherited from the Express endpoint. |

**Properties**

| Type | Description |
| --- | --- |
| <code>http\_method</code> | GET |
| <code>http\_endpoint</code> | /api/users/:login |

<a name="verifyAuth"></a>

## verifyAuth() ⇒ <code>object</code>
This will be the major function to determine, confirm, and provide user
details of an authenticated user. This will take a users provided token,
and use it to check GitHub for the details of whoever owns this token.
Once that is done, we can go ahead and search for said user within the database.
If the user exists, then we can confirm that they are both locally and globally
authenticated, and execute whatever action it is they wanted to.

**Kind**: global function  
**Returns**: <code>object</code> - A server status object.  
**Params**: <code>string</code> token - The token the user provided.  
<a name="getUserDataDevMode"></a>

## getUserDataDevMode() ⇒ <code>object</code>
An internal util to retrieve the user data object in developer mode only.

**Kind**: global function  
**Returns**: <code>object</code> - A mocked HTTP return containing the minimum information required to mock the return expected from GitHub.  
**Params**: <code>string</code> token - The token the user provided.  
<a name="ServerStatusObject"></a>

## ServerStatusObject : <code>object</code>
The Generic Object that should be returned by nearly every function
within every module. Allows ease of bubbling errors to the HTTP Handler.

**Kind**: global typedef  
**See**: [docs/reference/bubbled_errors.md](docs/reference/bubbled_errors.md)  
**Properties**

| Name | Type | Description |
| --- | --- | --- |
| ok | <code>boolean</code> | Indicates if the overall function was successful. |
| content | <code>\*</code> | The returned data of the request. Can be anything. |
| [short] | <code>string</code> | Only included if `ok` is false. Includes a generic reason the request failed. |

<a name="SSO_VCS_newVersionData"></a>

## SSO\_VCS\_newVersionData : <code>object</code>
The Server Status Object returned by `vcs.newVersionData()` containing all
the data needed to update a packages version.

**Kind**: global typedef  
**Properties**

| Name | Type | Description |
| --- | --- | --- |
| ok | <code>boolean</code> | Indicates if the overall function was successful. |
| [short] | <code>string</code> | Only included if `ok: false`. Includes the generic reason the request failed. |
| content | <code>string</code> \| <code>object</code> | When `ok: false` returns a string error but when `ok: true` returns an object further documented below. |
| content.name | <code>string</code> | The Lowercase string of the packages name. As taken from the `package.json` content at it's remote repository. |
| content.repository | <code>object</code> | The returned repository object as returned by `vcs.determineProvider()` when passed the remote `package.json`s `repository` key. |
| content.repository.type | <code>string</code> | A string representing the service vcs name of where the repo is located. One of the valid types returned by `vcs.determineProvider()` |
| content.repository.url | <code>string</code> | A String URL of where the remote repository is located. |
| content.readme | <code>string</code> | The Text based readme of the package, as received from it's remote repository. |
| content.metadata | <code>object</code> | Largely made up of the remote `package.json` Where it will include all fields as found in the remote file. While additionally adding a few others which will be documented here. |
| content.metadata.tarball_url | <code>string</code> | The URL of the tarball download for the newest tag published for the package. |
| content.metadata.sha | <code>string</code> | The SHA hash of the `tarball_url` |

