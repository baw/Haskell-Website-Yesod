module Handler.Util where

import Import

getProjects :: (YesodPersist site, YesodPersistBackend site ~ SqlBackend) => HandlerT site IO [Entity Project]
getProjects = runDB $ selectList [] [Desc ProjectId]
