(defconst razzi-packages '((razzi :location (recipe
                                             :fetcher github
                                             :repo "razzius/razzi.el"))))

(defun razzi/init-razzi ()
  (use-package razzi))
