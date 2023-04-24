(require-package 'dumb-jump)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
 (setq-default dumb-jump-project-denoters
   '(".dumbjump" ".projectile" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".svn" "PkgInfo" "-pkg.el" "_FOSSIL_"))
 ;;'(dumb-jump-project-denoters
 ;;  '(".dumbjump" ".projectile" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".svn" "PkgInfo" "-pkg.el" "_FOSSIL_"))
(provide 'init-dumb-jump-aemon)
