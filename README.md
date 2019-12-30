[![CircleCI](https://circleci.com/gh/rokibhasansagar/docker_udemy-dl/tree/master.svg?style=svg)](https://circleci.com/gh/rokibhasansagar/docker_udemy-dl/tree/master "CircleCI Build Status")
[![](https://images.microbadger.com/badges/version/fr3akyphantom/udemy-dl.svg)](https://microbadger.com/images/fr3akyphantom/udemy-dl "Get your own version badge on microbadger.com")
[![Docker Pulls](https://img.shields.io/docker/pulls/fr3akyphantom/udemy-dl)](https://hub.docker.com/r/fr3akyphantom/udemy-dl)
[![GitHub](https://img.shields.io/github/license/r0oth3x49/udemy-dl)](https://github.com/r0oth3x49/udemy-dl/blob/master/LICENSE)

# Dockeried udemy-dl - By _Nasir Khan_ A.K.A [@r0oth3x49](https://github.com/r0oth3x49/)
__A cross-platform python based utility to download courses from udemy for personal offline use.__

## Sample Screenshot of _udemy-dl_ in action
[![udemy-dl-0-5.png](https://s26.postimg.cc/67x3wfak9/udemy-dl-0-5.png)](https://postimg.cc/image/s73ijmred/)

## Source Repository
Go check out the original script by _Nasir Khan_ at https://github.com/r0oth3x49/udemy-dl.git

## How To Use Udemy-DL with Docker?
- First, pull the image
  ```bash
  docker pull fr3akyphantom/udemy-dl:latest
  ```
- Then run it in a container, login and start download
  ```bash
  docker run -it -v $PWD:/downloads fr3akyphantom/udemy-dl:latest \
    -u "YOUR-UDEMY-LOGIN-EMAIL" -p "YOUR-UDEMY-SECRET-PASS" "COURSE_URL" "SOME-MORE-OPTIONAL-FLAGS"
  ```

### You can also login using browser cookie instead of username & password
_Firefox_ users [Guide](https://github.com/r0oth3x49/udemy-dl/issues/389#issuecomment-491903900) 
or 
_Chrome_ users [Guide](https://github.com/r0oth3x49/udemy-dl/issues/389#issuecomment-492569372)

## _Features_ and _OPTIONAL-FLAGS_

- Resume capability for a course video.
- Supports organization and individual udemy users both.
- Save course direct download links to a text file (option: `--save`).
- Cache credentials to a file and use it later for login purpose (option: `--cache`).
- List down course contents and video resolution, suggest the best resolution (option: `--info`).
- Download/skip all available subtitles for a video (options: `--sub-only, --skip-sub`).
- Download specific chapter in a course (option: `-c / --chapter`).
- Download specific lecture in a chapter (option: `-l / --lecture`).
- Download specific subtitle for a lecture (option: `-s / --sub-lang`).
- Download chapter(s) by providing range in a course (option: `--chapter-start, --chapter-end`).
- Download lecture(s) by providing range in a chapter (option: `--lecture-start, --lecture-end`).
- Download lecture(s) in requested resolution (option: `-q / --quality`).
- Download course to user requested path (option: `-o / --output`).
- Authentication using cookies (option: `-k / --cookies`).
- Download/save lecture names (option: `--names`).
- Download lectures containing unsafe *unicode* characters in title/name (option: `--unsafe`).

## _Usage example of the original python script_

_Download a course_

`python udemy-dl.py COURSE_URL`
  
_Download course with specific resolution_

`python udemy-dl.py COURSE_URL -q 720`
  
_Download course to a specific location_

`python udemy-dl.py COURSE_URL -o "/path/to/directory/"`
  
_Download course with specific resolution to a specific location_

`python udemy-dl.py COURSE_URL -q 720 -o "/path/to/directory/"`

_Download specific chapter from a course_

`python udemy-dl.py COURSE_URL -c NUMBER`

_Download specific lecture from a chapter_

`python udemy-dl.py COURSE_URL -c NUMBER -l NUMBER`

_Download lecture(s) range from a specific chapter_

`python udemy-dl.py COURSE_URL -c NUMBER --lecture-start NUMBER --lecture-end NUMBER`

_Download chapter(s) range from a course_

`python udemy-dl.py COURSE_URL --chapter-start NUMBER --chapter-end NUMBER`

_Download specific lecture from chapter(s) range_

`python udemy-dl.py COURSE_URL --chapter-start NUMBER --chapter-end NUMBER --lecture NUMBER`

_Download lecture(s) range from chapter(s) range_

`python udemy-dl.py COURSE_URL --chapter-start NUMBER --chapter-end NUMBER --lecture-start NUMBER --lecture-end NUMBER`

_List down specific chapter from a course_

`python udemy-dl.py COURSE_URL -c NUMBER --info`

_List down specific lecture from a chapter_

`python udemy-dl.py COURSE_URL -c NUMBER -l NUMBER --info`

_Download specific subtite by using language code such as (en, es) if lang switch is not specified then default will be all subtitles_

`python udemy-dl.py COURSE_URL --sub-lang en`

## _Advanced Usage_

```
Author: Nasir khan (<a href="http://r0oth3x49.herokuapp.com/">r0ot h3x49</a>)

usage: udemy-dl.py [-h] [-v] [-u] [-p] [-k] [-o] [-q] [-c] [-l] [-s]
                   [--chapter-start] [--chapter-end] [--lecture-start]
                   [--lecture-end] [--save] [--info] [--cache] [--names]
                   [--unsafe] [--sub-only] [--skip-sub]
                   course

A cross-platform python based utility to download courses from udemy for
personal offline use.

positional arguments:
  course            Udemy course.

General:
  -h, --help        Shows the help.
  -v, --version     Shows the version.

Authentication:
  -u , --username   Username in udemy.
  -p , --password   Password of your account.
  -k , --cookies    Cookies to authenticate with.

Advance:
  -o , --output     Download to specific directory.
  -q , --quality    Download specific video quality.
  -c , --chapter    Download specific chapter from course.
  -l , --lecture    Download specific lecture from chapter(s).
  -s , --sub-lang   Download specific subtitle/caption (e.g:- en).
  --chapter-start   Download from specific position within course.
  --chapter-end     Download till specific position within course.
  --lecture-start   Download from specific position within chapter(s).
  --lecture-end     Download till specific position within chapter(s).

Others:
  --save            Do not download but save links to a file.
  --info            List all lectures with available resolution.
  --cache           Cache your credentials to use it later.
  --names           Do not download but save lecture names to file.
  --unsafe          Download all course with unsafe names.
  --sub-only        Download captions/subtitle only.
  --skip-sub        Download course but skip captions/subtitle.

Example:
  python udemy-dl.py  COURSE_URL
  python udemy-dl.py  COURSE_URL -k cookies.txt
  python udemy-dl.py -u user@domain.com -p p4ssw0rd COURSE_URL
```
