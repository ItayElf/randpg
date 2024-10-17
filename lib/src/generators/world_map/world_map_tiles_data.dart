import 'dart:convert';

import 'package:image/image.dart';

import '../../enums/terrain.dart';

final worldMapTile1 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAXJJREFUOI2lk81KAlEYhp/R0cZ0xh8MlMC8Aal14KqdgRfQwhsI2nYF3UAL1xLSBXQD0cJFQSAiBC0ChcEgf5gZzXFUbDE2OlH+0Lc5cPie57zn4xzh6vZkxoYVDXoB6A2mzp5nFZAQRGdNCCLvnZFLlBBExFXwvuQBU+T5cYwSlgGJes0AQDdMXuB3wcicQEDk7sE+0YZB1wxXnyJLbkE06KU3mNKueWkzRjdMFFlC1wxK6QLBwyRKzO/0611rIUgIIiNmqE8zlLDsnFZKFwicHhMAJE2Dfn+RIOZ3J6jfT5y45WgO33mey909rj8/iKgqeteipY9d13AEjaGJbtjDKnqy+M7yXMxhrfKK9sewHcFbxTYXPVl2MhkkTeNGVRlWG/gBKxJfLVBkiXI0Z8OpGGazS6fZghUwzB/S98OYhONIqRgAgw1gVwKA5NEBFmA2u2tBV4Ll8vf79H5Meq1g+XNsW64ErWrjfwIAKxTaSvAFaVuBVhTOPJMAAAAASUVORK5CYII='),
)!;
final worldMapTile2 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAYlJREFUOI2dkr9LAmEYxz+npx7+uFNJKAQbWhMCoaaGaG9wbGpu6L/oH2hoaAqHxgbJIQgsQqEhENoKIl0MLO3OX+ddZYPepalpfZeH9/vyfni+z/sI+yebXfoK+ZwA1JofzCrHvCAOPX5+7TAviFi+VSdJzF7UAZADUq8qQR4ATa2TWHMRlRygizx338d3YD20pKl9oBLg9sYkfdUBoKOPBwiR0/OuHHZ/A6oGzVKZnadU71zX7e6iqwIhn3NoRsLSZbY7SDT8flqKAkA7kyd5d4QckJCVAJpaZ3lDxNMS7EiCeHw2BAjJLuSwm7dolD1vhINWBfMkze7ntR0xseayAY6fmWqaSfGpiZq756BVYc8bwbW9xaFj3Y5UbOvfQxw7GcD99kI7kyf1UMCrqnjicRvymDOnA4zgHADlQhG9VEWKhfHE46RjSQZ/biJgENIslQGQYmHelZ5nLd6vAAtiBOfQS1UAFlYWh+6nAizVNBN3ozHizwwYAfaX6c+AcqH4/w4Mv3/E+wJNQY5E+4wV2gAAAABJRU5ErkJggg=='),
)!;
final worldMapTile3 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAUVJREFUOI2dkLFLAmEYxn8nnsgh3mlXGUHgYAQVBA0tBYGTo6P/QpBT0F/gHDi0OAgNQlNjQ0vRLIg0CA1lIRqJdHZqfYU2eXjdFafP9r0vz+973kfKlZIjuR+l8yzIR9LM7a7TvHvBq3wAX0rHGvRV1bPZAgB0jfepjA7ArHIAFMOYHSA0nYBpsrSxOD1ge0e2hn1VJRKWXQ2ugJjkZzno4+ihQP2xB8BwM+4J4gNojb4B2N8SKPUaWqNBVpn3BLFOKA8E5YHgYHjL602Zs/uKJ4iUKyVHk4OY5KfabFPwHSI03VFowDTpdoT19rtRU/EFUpxzXQmQf0sjNJ1IWCa4EkWEQoQx3QExyc5LrH2QrV1wauzxCfSedNveb7TtgHGZrYE90cnqFdVmm6KR4ThxaZ1ZJOPs4LcmU40/sKX4z/yXaVI/05ps3STLNy8AAAAASUVORK5CYII='),
)!;
final worldMapTile4 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAVBJREFUOI2dkz9PwlAUxX81pSENlD+pQmMcHEgckJg4uJo4+TEcWBiY+AbGwdnRxTjIyOIXIOhI4mJCZFBMSJqAQBGFQNO62EIFQ+FM9+W9c96957wniDf3Nj6hpRN8PDyT75aI70hM5A4bfskA35GIW0/kDsBqAg76xqdbryUwi5UEZMNYX0BLJ5AGA8ZRdXWBmBLwGHh4FPAvEFMCWPu7ADTevii8XrMd3CApiMsFHHJe3iTabCI3ahwfjAHQbRMA0Q/5tv5Eq1wlZ1WoDseec2JMmc6jxCXGodB01zA4f3xB6rXJhoukNBX9z7sVlbjkLhzy6L1Dtz9B6rUpdEu/bW/RHFlznYqtchUz4o1GNNrIQM6qkNobMWtVUhDd+V0PstYVGU1Ft00u66echYtkNJV6LYhum+jD/5wC4eLuZO43OhEBntsWYWEKy0iz+AH+qW8rXqYbBgAAAABJRU5ErkJggg=='),
)!;
final worldMapTile5 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAPlJREFUOI3tk79qwmAUxX+ffBGMIcGkSIu0m8WhuHRwchJfovQJ3ISOXTp0KwgOzk59gtKlo1269AFcBKUgiAmGINXYfB1CgjqUgqtnuRfuOef+gStk/0VxADKHiI8GR4MEsmBqAJh2FoC1YbC0rB2SvlikeTYI8N01AJ4fIreFCSEheX5It9DlbnRD/uIsbbIdhfnwpFrRgHLlm/awCcCt9wrAdU1jpSvGnzl6mXpaO6n+AGBEReR96QN3Eo/XuXzj3a1QKot05Ol8hX1uwRe0ogH2lYPhxCsFMxCPzw2lLW2cvB8L1ObPo50KucOTAKHuMv3nU+83+AUNuFCZnWpB0QAAAABJRU5ErkJggg=='),
)!;
final worldMapTile6 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAQxJREFUOI2dkz1Ow0AQhb/dbBIDUWyDJSyloKKiRIKGji4tLQ2n4AR0HCPiCHAGkGgQB8CgKAYFol3nx1ksTBGIhGi8mfJJ79PTmxlxcXVchhs10vc5l+aMraM9Bo+vVB05zwsAbBJUNv0B7Kx5NKcCozNsEDkDVFoW9O9KemGXsF13TwDQC7sAtDcbqwHOd284iV4AaIzHboBYKGKh2H57wnzY1RIksxyjMybPAwCnLmQyyxk+1JY9gFsXsukpOgeC09E1Sg8BsK1WZYACiIUi8z1nM/yU2PEkAIUfMfV9N8Cv2ehsKbqsUvXzr3+iyzplWi6eaf+wjg0i1rVmZD6rA2KhALi/XZhcL/EblHZWh8eIOwEAAAAASUVORK5CYII='),
)!;
final worldMapTile7 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAQpJREFUOI2dkjtOw0AURc8EJzYo+BMsZZALGko6JNhD2rQsg/1AkSUgVkCTIg2CHoMQCIVYM87HjAOhsAyUHl43xT16Z+4TzuXVhoazf9Tn/eaec/8CueeSLT5pNQ3/HZOGAHwUa3uACWO0ynGXgoNtzx4Q+W1G0YDJuOR1848N/F4HgFE0AMCxCXfmcwCG8ROH0Z09AEDPDP23B2SvijZWiPw2AIvHF7TKSVeFHaB2h8p/ertFuiqaA0y3C4Cjppxl1yQnAtdz7FqoIX6wixSWfwCwDALWQQxA4rWQwmKDukIArfIfSOMa9cxA8vt+Lr4AC4VMl+wohQljjk+rSq1PudaYjEsApHD4BuCAVGVBZdKiAAAAAElFTkSuQmCC'),
)!;
final worldMapTile8 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAO9JREFUOI3tjEFOwkAUhr8p0zKRtI0iphbUu7jxLq64kIk7LsAtdCNxq9EEIshomJboxDSOCzNo1QQPwLd673//+8TZ4MRNXUUmJF0VMLHvTF0FQKhz2p1HgF/Z/aulqSQBQCYknq4KyIQk1Dmjqxue5nv4Tqhz7m4nn3u7yXargTjtH7uitAD0ep2VaDyek8QKgCSNKUxJUdpaFh0tkABJrChKS2FKALzQ459/ZowaCHk+dADRQgMgja4Vq3QXgNbhPslO9CV4fgNAHFxeOB++pGntecuY1Rwtl/yFfLiefVtntaNhPcE/OhvBRrCWD2PZV4cYmx2cAAAAAElFTkSuQmCC'),
)!;
final worldMapTile9 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAR1JREFUOI2l07FKw1AUxvF/ijfNlZhaIVBDkG4K4kOIk4/QB6i7TyJ07Vt0cXR27CDo1kG00K2GJvQOdQjnkpjEBvpN4YT745ybE+d19rAD2KYrAKZXYwB+kjfM7hiJwQPgE59iOvLg6tAWh8EAAOVsbE2RUZfO38L4fQrAiX9deyAmaQaki8V6+W8XMYmFSoD2FACj+aTUhXI2FiqOEpOUgTQzuDrE72oW6yW355e1oygyC1XuQDKaT3j5/ighxXEEqgDyOf2uboVUAFeH9PoRvX7E2elFIyJQ7QhpZoD8UovIMBhwE92VIEc2sSnaU6SZsaM9Rff4QWzf7wXqEIEAjvYdlpHyHckXbZuuePx6bg8IIin+N4170DYHA79eTmkqVDSjlAAAAABJRU5ErkJggg=='),
)!;
final worldMapTile10 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAPdJREFUOI2l0zFKA0EYhuEnYTdxYRURAgZE7FLkFDmGB/AAXsXWE3gCSxtLG8FCuxRBA3ZLSIIWWugOk8kuRPzKgfd7Z/6Z6Yzvb75EObEAuXVYyztL++UYXDxfg14xAF0NSWE4OzgOazW8VVDb06T2OFkKttmn1XzLDt0mOO8sA1zbzx+vQLGXbxbUYGyOtz4ZjkyrubJf6BUDq/XnZkEKxubJcOTu7SXYm7IxxDa47BfgY/W+VZDFYBN8dHgazp1uH7LYWt/1rjBk9ZThafbg8vUW9H7hNjAULKoZBJCfu94FhiwFsTMMWfqyaD9vUxo/01/y74Jv+eNc+PvcC04AAAAASUVORK5CYII='),
)!;
final worldMapTile11 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAPNJREFUOI2tkjGKwkAUhj+XzTKRkE6IYpHOLRY8g6UH0dKreAAPYO8FrD2AhV0QQSGwiAZGM0UslgmZTNSI+1dTvO//37z3GqvFOOMNfbwD/4vBZ91CVzjIiwIglfFrBhougtPOsJ5BGZ52hnh+F+9ZB65wAJAXxe9xy7w/IfQDfoDodOCcrO8bVMGDdo/lfpODACpr2gapjEnl3zu5ykpYZc283lrjl9uqDVcaaNWBFcI0cIVDKmOSqyT0A+vPRVAh7A70ocz7EwAjWadrEGCHZw5R7zr0A6LTwWpbw7v8CipmMPseGellFWHDoHimj9LLugHtOorGCMqGWQAAAABJRU5ErkJggg=='),
)!;
final worldMapTile12 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAARtJREFUOI2t0zFLw0AYxvF/gpWkxCJCoXWQbgoOfgZHR0cXNx2Ffg4HoasfwN3BTuLk4FjEwS1IOAMFa2Pg2maIg971cjEQqO8Wwv3yvM8R5+n2PGeFcVc5/C/A2kKO9cO63wbA9xrIWVYPuNo+AqAvhiyxdm3EOR3d6RLTJKIvhjpNHcQ5frzMATaCfXqtDgBhEnMyGrC1uYPvNQAqITfLmwB8pS88i3vCJOawu8vNwQUfn2/6oIJKAECWNzGhh/fXAjKdCKYTgVl4AVBThaRzqXspr4BHHaRqflbAw4ZMpNfqkM4lCzkudeFGBMuv/yJ2J4BOYd+GCxARoCAziULCJNZXbBdZKNFMY68CcL13Vnr3589UlUKNmeIbJQOX4WlXK0kAAAAASUVORK5CYII='),
)!;
final worldMapTile13 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAMtJREFUOI3NUz0OgjAU/koeBgzByUQNg5uD8RDGE3hMzqH3kIGBhAmCQiQRB3wVSosDi9/S9n0/7zVpxf4aNpgAa4r5PwKoewhQ9MgYHkw8c6SaxgJ1HKmEjUruazjGAAZ1DWNhxgAAsMWjV6yb+TDMoCGV0Im10300dNicZDHKEwBAkcdorGxgEq8FPD/A1l99rxDliSwc17u2yqsBt3smG4pLeJZ/YeYuf47OeJZpO4HO7Dq21lRWtdyznnRdWchBXaOKwUMydTThDY41O7CoBfp+AAAAAElFTkSuQmCC'),
)!;
final worldMapTile14 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAL5JREFUOI2lk7EOgjAQQB8kNaCkTCYMDLj5Y/pT/oW7H+DsB+hAjIkTBIRIIk4gYgs0vqlpru8uvTvruN/WAM/iDsBuvSGSAafrgaqeA1DhABDj0cfuX0QyaM/Cevw80Apm7nI0eFDQSFYLn0t6UwaHZMMCHYJyvALXEe1llsYA7ScOoaygtpMphX0E3ewqjNpoig1QlNV/Ah1Gg9Stwnr5yuDJc+DJcDSzVnDOk699MBI0G9nQH6RJbdTtgY43uHkx25w16OcAAAAASUVORK5CYII='),
)!;
final worldMapTile15 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAMZJREFUOI2dk08KgkAUhz8DQ0t0FUi4sHV0is7SqTpB9+gQ7XLhQmiVmEpCtpAnNf4b/DYOI/N73/DeGPvrpUYhIAPApGy+Rs5heyRKE063MwBLewPAQj2sYhp5uw5dv/N/MqAPqd4bIPoqUZqwW3t/h0cN5P5TTF6hqlcAZGnc7tmWqR8g1IunnkGM01TGGg0Ui1ldGDXQpSgrvYDfQdIyGJoD4+N1qmsZCI4b6BkMEbo+91e3lYNtFGSQhHfxmGcAzXtQ+QLeFi8kqfsIkwAAAABJRU5ErkJggg=='),
)!;
final worldMapTile16 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAANFJREFUOI3Fk60OwjAUhb+SjmyDbIoEMTEeiRdA8jK8DQKLQiCRKBBLIJmCDEZYQlEF2v1AMsFR7T3nO1c0Fev5VNFCnSbTcx0812kskPc8BaDrDQzQLgLIb0W5QB/uefoqqQra0ovFZLNQcTAEYNQLv4IAu8sJgP35iNQwwPKwBSA7J6jOqQSKR0g/iNBMHAwR49Ws1SvIQvk44moMC+WXgnUZWQfYqsvIAtfcxO0NWV5lQWnTD5BRkNB/XSIyw/z0bF97sgmwVeU3/oVf9P+CJ5IpPc9rfTtMAAAAAElFTkSuQmCC'),
)!;
final worldMapTile17 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAJxJREFUOI2dk0EOhCAQBHvViCbyEl++/9gfaYKaqHtACbYMgnPhQKZSPQOf/vfdAWAxJQBgnuw5jMc5F4hV/DahRIDu1jxA3doG1VwbtdryDXIgF8Bp4Rq9GFptQdDNgKPwLBgS3YIPYZsogKO4xkAk0UDcCtlUcgALWUzpIOcr9W0eX6Ifh20eDdgkBEn+C3W7BoebZMCgVwZS/QEw5TaThBi12AAAAABJRU5ErkJggg=='),
)!;
final worldMapTile18 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAIJJREFUOI2lk0sOgCAMREdDRBO9/9ZDeD0/C1LE0pYSZ9PVm77wGcJ+3DCyxSvN9QQAxDnNaUlztGBPXAW0vbuA9Clc3yzQYJ7QArl+ub0y0GBJvTIo4XKrpp4LWsoUafvXQAAt9dfAAFswIFxjDwwAQTskDwwI78AL5oJegOf3b3wAwdUnpTlJApAAAAAASUVORK5CYII='),
)!;
final worldMapTile19 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAHhJREFUOI2lkEEOgCAMBFfwN77cf/gjTBQvciIppS1W9kgy22GX7dhfTCTMwACweoHniv8KOOgqoHC+26LhBhY8NKiwBKYz2gUaXEHTQBuMwikH24Be51crDAgjcnUL7gy4uqTMI752wylwU6CubsCqAdD/3V3wNQWSpT7phdkg0QAAAABJRU5ErkJggg=='),
)!;
final worldMapTile20 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAI9JREFUOI2lk0sKwCAMBdNY+jlLT9579EYKVUHalb9IomCWEod5xizXc38wUThzGQBg9a+qDrYzzBn4VwGFigbO1s37ERJoxKYxKIEjJqiNAm3qRmdVAvUgyYAD9SCoHYJ2OQmFxOIg2YBAIog+MgugkNJGitJMoReJQtivTG24KOIucJDSYmiZuMkMA6T6AepBT4NDMEFKAAAAAElFTkSuQmCC'),
)!;
final worldMapTile21 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAF1JREFUOI1jZFmw5T8DBYCJEs2jBgwWA1h42f+hCHz+iWkmuhoUA0hRjN0FPH/xKvj8hRnTRUh6MFyATzFWF7Bz4FeADn7+QHURQRegA3QLsRrAxkm8q1hIUYwNAACB+BL7wvOWjQAAAABJRU5ErkJggg=='),
)!;
final worldMapTile22 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAFFJREFUOI1j1D6y8v+v78wMMPDzB4T9+QuU/snEgA/glyUCDHIDCPkfbgAb51/auGDgDIClAYpdwMv+jzIDKHYByQbA8gHFLuDlIT5dDHwYAABNtRN3Ybq3EwAAAABJRU5ErkJggg=='),
)!;
final worldMapTile23 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAFtJREFUOI1jZFmw5T8DHsDL/g9C8/xlYGBgYGDn+AuXY+P8y8CETzMxYAgY8PknfiVku4CN8y9lBlDsApIN+PyFmTwDYAmJYhcMHgN+/kANC6INgGUmil1AdQMAH7cPt9bRWA4AAAAASUVORK5CYII='),
)!;
final worldMapTile24 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAFxJREFUOI1j1D6y8j8DBYDl13dmDEE2zr/EG4BNEJuhJBmAD/z8gWo4C7oAqYCgCz5/wbSAlwcRRizYFJBiKIYLPv9kwrSR/R9Ow1iwaSDGUBggrJsAGDVgMBgAAGDHGVPMF92RAAAAAElFTkSuQmCC'),
)!;
final worldMapTile25 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAMNJREFUOI2dk00OgjAQRh+1CxJX7kiM8QLewrN5FU7kBQxp0h0rky5K6wKLlB9lnBWUzMubr0Nxq68RoCo0AJf9GUmpcfOxVKJmADVuPuxOcoCNfnhpu4a2a/4zMC4AiC2UjZ6xhbSy1IwL4hF0ehgsnIbyA/k1UmZQFTq7yi15ZAAbPcaFIdAt48w2J4U6hazBFlcvXS2sB5vO9OwLeaA2enB9NvfnI8uo7ZplwBSUIMkI+tU3LnwHLFqletvJf78J8AXK9mZFJ7H2mgAAAABJRU5ErkJggg=='),
)!;
final worldMapTile26 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAK9JREFUOI2dkTEOgzAMRR8hAytbJcT1esDeonsvUCEkNqZKGULSATkNKQqEPyWWvv+zXT0fd0+BXp83AJO3AKgSM0DXrJZbpa81aOt+00SXmOdl2Pwnb8sI2roHYDTuGkGaDoU7mJchpIsOCeK5R+NCsuiQQOaG9YRyvmICQT9FIKbYPHn7Zw4N0vtKLV5Yii7Se2ldo34LM3o3ORBIymgc8VtMOTOAPpOSkzqTktMXlNJwKvwXjv4AAAAASUVORK5CYII='),
)!;
final worldMapTile27 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAANFJREFUOI2lkksOgjAQhv/SkpDgI3VFJMQLeAvP5lW8kgcgMWwMC1wQeYyLWixSbdFZNc18M99My46nA+GPCH4FEyYAAGIuoCONAqAW3w00lDChgCdonq0GGtRdNLCPd0NO2eWQPHPvII0CSJ5N7vXdpICpaybaigDGEm1L+gSZMbQqqEVBLbYNA1Xqa5Rd7iwwMWBLhlUvgR7g4cLfQGub0TU3t8H77JJnAHdyL4OC2lF3n7mtBlQR1vHGa26rwSVUm/eZe1QAUE8IAOf7dbbBA/IUNAWROUdVAAAAAElFTkSuQmCC'),
)!;
final worldMapTile28 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAANZJREFUOI2lkUsKwjAURU8+hYJFyKxYshrX5lZcjlMXUBAnUlAHYhvjKDGV0vh5o3x4h3PfE5vt2vNHSYBa6J8BuhaappRwG0OOfvjMoCklAE0pSc/BKmenjbJ0rsUoC4BZQOfaaJXaTVlJIDanZZSNRrMRph6jTQJOY2UBcya10CNQdn+dawHwF88KwU73o/8swCiL66+wgLPsqN8Gmo3g+uvo/j7YrIEqqpcNVYwU5pDfU1KhOVgc/fAdwCjL8mHwFx8tvgKEeRwK/5uBKir291NsBngC1iZDGBnbmdsAAAAASUVORK5CYII='),
)!;
final worldMapTile29 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAJNJREFUOI3tjU0OgjAUhD9ISTwCJ/SA3sIFl7Ap6Qpc1NDQn+eCFNTEhSHueKuZl5lvquvlLOy4ek/5AByA/wDGpH8HlNJn+dV/0wC18ZkxaYzPAKTgSMGt4aKLNz4z3G+k4BiTRgF007wkvELCQN8IViJttXlO20jfCDyWv7IS1wUrEaugXbhvvptm2kpR8lYBAk8dumJYdvxSkgAAAABJRU5ErkJggg=='),
)!;
final worldMapTile30 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAALNJREFUOI3FkksKg0AQRN/8ggsjuBNCLpEr5Gy5So6TSwTFlWI+IDjaWYgh2TmTRXrVNNSjuqvV6XyUQlkAdokmN3tCSi9NjBhAF8pGiwF0LZ6yn2jHaxTALvuX/QTJDAlxY2vxHLwDINvk89Ssd6ABLnYAoHs2AIzDIwwAUDlBbRXGpRiXhgNq8atFn2UBfony/3/wdgBEQXQtHrkL2ZTH36ByQvdsgvL/cgDzH9x0Gwx4AZ/9Q1wSVQe5AAAAAElFTkSuQmCC'),
)!;
final worldMapTile31 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAALVJREFUOI3VkkEKgzAUBSdGiwUrZCcUT9E79YC9RTe9hFRcKbYKgtHfhahbk12zf8P8l6eej7vg8Jqp4D3MAFRiCVzCAEbnXOM9FroCVghxAUPobgD7GZVYN4NmKgC2DjIVugHS2QAgYw3AKxyPnzCNHQBtv4eB4wAdJegoQV0UZbT/vFeJlVh/gNE5t/OJTC31/dkO1jCwzNnHwOicdDbIV/wMprGj7WvKSMjwMPgEzbaDSiw/SyhTe7L7yg4AAAAASUVORK5CYII='),
)!;
final worldMapTile32 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAMFJREFUOI3tjUsKwkAQRF/PR0YSjMkqZMgl9Aiezat4MVFcKaKCkM+4UGOIgri3VtWvq6tluVoEBsrFsAv12zzkAKYPczFvRUUlbG1gVlu2NnQZ7xSba4sCmNWWXAzeKYpKAJiPRxSVkEQZ3imAbuedIpwC3inMMyTqAEASZXDZg3v4h5IoQ9sYadZM2hQiOJ72mGco1SWHZv0K6xj0/Til53XZ+WwaY7SNuy+pLmnaM332TWoIfjn+WPCr/gX/AoAbOWQya+EkMUMAAAAASUVORK5CYII='),
)!;
final worldMapTile33 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAYNJREFUOI2Fk01Lw0AQhh9tmg+TxtrEluJ6qZ8XP/DgxYOCv82/4u/wogdBQS/SKiK4UqixajFmU5R6iIm0mjqn2Rnm2XlnZycODvcHjFj0HHF3nvgqjDFtAyFmqXguFa+UxF/qvM4coY0Wp6bCOIFFiihSCDELU4pupAColIHnvXxAWgxQF1Uqnst0cRoAvXpNeLvOu3HJZF6x7WtYlsnu/hYAQsxRKjlZ/v2zBZAPCIMPyp6LEHNZzHGmqNereIUdVleX6N738wFlz8X33ex8eXE1lG+3OwRBb/wMAKR8ACAIepwcn2XxIOgB/A9oNSVKJS9y05QAmLaBaRrjAS9Pvcxf31jIYG3ZIYoUlmUCY4Zo+xpt2UGpmO43bHlFsLa5iGWZmLZB2XPzO6g1BoRBcouUj0j5mLUN/C/hL1MqRoVxsmBP5EsoFAvohkZju5CtNDDkp1v6Zwe6o9N/66MDjW24PR0u9Ocdao3BeAmjkB+zgZ8PnPsKKSSV8ytnaOiGxhdJjYwFGBHC6AAAAABJRU5ErkJggg=='),
)!;
final worldMapTile34 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAXlJREFUOI2NkstO60AMhj+aNBca0h4SGqIGCUXc1izYsACJZ+NVeBhYgYQQLNg0qAImaRkoTY/OUVmEDBQaqFeW7f/z2J6F45OjSbN/iNXqAZClz2SpJEkeyYdjrIYJwPou2H9svppeirPRYxFZBFLoi6cvpeY3MUDt1bwgH4SsdCTNekCzHrDsuYRRG4DRKJ8pVACA1/83KrC05BBFHQAOjnaxbYuGr1cDsu5fdnY28bR9wrCN4yyqZBR1aHkuQ/GvGiCEpNd7mApenF8p3/ddWp5bCdABzk4v8f2uCgohAUiSu0rhFKAoLs4GqNPdXCf4fnV3AH2QFt3KbYdRm63tSAGEkAxSyWrFGfWW55LnReeN7Yjl93mzVJLnY/riCX/N+XkEyzLJh2OEkAghFRDAti2CeDLnCOnH/PNaTYnfrVxk6cd7Goapo9W12S+I9zSgwf3tAqL7gm1bCvJZbDjGbEDpBPGEIG5MJX8TA9QMU8cwv//1ecQAb7nGieZt+7WoAAAAAElFTkSuQmCC'),
)!;
final worldMapTile35 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAKZJREFUOI3tj7EKglAUhr8bEQViZEKDOAa+RBD0bL1Kz9Hi3CxBDl2HSoq6FyGJa0Polhmu/tOBc76f84n1ZlXQIr02cFfQFZTpNz1UkVXNafr4r0BFFs7UJgjmaJ1xSHd4PiTHBgpxaCoYQCmN5392wnrVfxCHBte1AdA6QynN5bnHyQtGA/FboYQBpEzIh2cArieBMysY35bfFeLQ1KoZueA+2fIGa+E1jWp/jvUAAAAASUVORK5CYII='),
)!;
final worldMapTile36 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAKlJREFUOI1jbF3m/J+BAsBEieZRA0YNgAGW+0f/wTkiInxwNq/6F+IMUNBnY5CWZWB4+piBQUlEk4GHh4vhxo3bDO9uEmcIEyPPHwYGBgYGaVkGhs+fIRo0NFQZhIT5GJBdh9MAGOP7r/8Mr3/eZnj+/BXDly/f4F4iZAgT/3sHhu+//jO8e8nIwMDAwPD6522GJ0+ewhUghwtWAz4KHmD498QWryJ8rgAAJlE2jgInwhgAAAAASUVORK5CYII='),
)!;
final worldMapTile37 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAfFJREFUOI1tkk9v00AQxX/xn9iJnS42IVGk9BIJUalHRA9wAXFEop+Kr8K3AEXkBEhIVEIopA2HBEWtnTQOrrOukMzB3ZXTdi+z82bemzerrb17/7oAEJcvSYIh6lTzbvEEue6RBEONq2ioZqM/IvBM7Cwk8EyM/kiTAdwHC+wsJHNOdB54JoadhSTBkDQSVE8aCewsZLX8ixmeYYZnZSFzsbMQgEa9hrGaXZdA5pYilSjsLkIIoklnR5zMxQzPiP7sYSkAQNhdEJAkcHDwuHSSZrRaPvMJCCHgxmg0AZoSK443PH/xVDcDJElCmmb4fhPfb7JYXOjhrZav77+nm9LBYnFBr9fB95ulEyH4+OEz7fYeAHG84dnRIa2Wr3tOvv/kdDzHkjJn9OkbruvsrLlebvRdypyvX37w9vgVauB8HgFQe3N8WAAEbaFFpMyRV7kWcL0Srw5RPVav30HKnMs4odFwcT2Hfv8R4cPS/q/xnPVyg+s5SJnfcWoo5aBdPm+VvFpukLJ0ohypXB2ruut2Kzkdz7VlRdxuJY2Gi7zKtROFG1WyitX9b9erou19H2twZAJwPvWJZ6luVoT2vs9g0OR8ahDP0h28OyhufiLQHRR0B96dyVAAtXvqRfkGdcfiOv93DxHqjrWT3+6rOxb/AQ1E8Ps6/50iAAAAAElFTkSuQmCC'),
)!;
final worldMapTile38 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAadJREFUOI2Nks1q20AUhb80jiQLR7IsK6WNSqE4dUghEApeOBQC3fa1+ip9DnebRbsqxDWELlRMLNnKCFl/tusu1Ay1iUwOCEb3cs7cO+fsff7ycc0W0jDl1zdwXUfWWq8UABqOIJyvMMMrhDXg2Tb5fwRBtPHvHEfUlT0AhDXADK92C2yIJBpqegHA83VX9muPkYp8yct38OOrkLX+5XviOMEfHYHuc0ALYQ0eF1DUGkW+xGqbaJpKu20A0GjomKaJENCyD8nC8+oVbq9XaJrK264LQBwnstd4fSfPlQJN25A3A3jeb+I4QQiBEnfI7l9Ur7CNIIjwPB8A52TCanb4dBd+Dj2yLJfkBzzkoHKC+2kkidk8p9c/wx8Begb4LKzh7gne9PYJA0EYCHr9M1z3GNM0IdEAOEh22FjkSwDqdY2mbXB6egJAXv+OcwRpseaP9wGhV0RZUWvcXq/odN0NJ4pJKaTEHfmIlRM0bYOWbTCbllEejycIIWBhsNCHZZyb46fZeHMzAkoX0mIN7JN5O3KgqGV5No0IgvK7/KTIfjhfwb8V/gLMIrWQCOEO7gAAAABJRU5ErkJggg=='),
)!;
final worldMapTile39 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAbFJREFUOI2Nk0GP0lAUhT9mOtBC4VGGYlASTZwKySRjZpZubOJv86/4C9ya4MLNLEx0h+hsfITQMq0PobSECS5qG3GmOm/1ct+5J+fce17p9ZtXOxG6KGuIVTtk6QsAgu8bsiOlz5MLMCyDv89B1gxglEvYjxZ7gPl8catpjyC7PNj1AaiszyHS79UMcKCsIUdRi2Dt4487AAwGDvP5gqn0mEqPh6dbNsn2TgJNhC56c0pw/RMhBKZZBaDdbgAQxwmwpVzR/m3BfDzLi8tlBMCzfg9dr3B1eVNoQVPWEEIXHQiUol43kXKSAzIlkNyt4M8t2I6HlBM+f/p2rwHC7yGK0M0LtuMBqfcvI/l/gkxBsPbxJw38cYez50+JVwlxnCClz4/rYjVatkYAIh0hBPW6CS/g/buPAJy+rBUrAKgmZ5i2wnY8yp0xplllMHDo9joYRhqqohzkFsrLkxToOflju93gpN/j6vKmMAea3pyi7/rMSiOOJi2IFADdbprK1nGD5nGDTbLi9lcCbVYaIUIXq/cVagqjvMAfg1Kq0PceQZ6DFVi1QyBd5Ye3mz1gkYVfcA6qSfceT9cAAAAASUVORK5CYII='),
)!;
final worldMapTile40 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAQJJREFUOI3tk7FKxEAURc/EZQ0ym8U4a4oVwSIONoq22yzY+lv+ir3+gDaClYKNbKNNDBiCQYlGYjQWYSYGwWY7cZp3L/PueQ+GEYdH+zVzHGee8D/gzwB6RtydfwKglPdrIE2fAdiYNLN7Jjg56DO7cNne2ULKJRvI81ei6J5RmLBY7Nq7k+PTBrCp1yjdBID1vYLryxv8FY/STfCDmsdUMA4b2G16RT9aZRQmKOUx0DlO6SYIWRFnFQBy/Ma7ivGD5osIWVGUrTbDBjpvNhCysutmLx8ISce3dcFC4qzt6bzCMJv+CAMEtbY+qHWn3zFimE15Wj6zkO/1QcysN9r0fwGIJ2QrN+KeYgAAAABJRU5ErkJggg=='),
)!;
final worldMapTile41 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAXZJREFUOI2FkTFLA0EUhD/FQs0tCUGMKysoGNEiKIqChWhja/A/aKOVnYVgIxZaiII2+qOEFMopnOjhGQkhYfeiYKFFcksScudUu/vmzb6Z13d4XPylC69ehTfvB4BaXZNJC+R4DilHLSefn2R/74iB7uYItboGwOgQo0PkeI7dnQNbv7274PrmJF4gagaYnZtGylEur04BOD+7IZ+fZGN9m/645sJCFkek2CpuAtBofHXUn55eAOiLy6B0X0UpiVJj+P4HSo2Ry4108FzXi59AKYkQKXuvtzKJUC5X0DpMzgBgeHgIAK1DXNez77qVz78CruthtAHA9wMAMmmBI5xkAd8PUEoCsLhUsGKPD88YHeK07CVuoUk2BMEnADMzUyyvzOOIFJm0QCmZbCH6JXgvE7yX7djN2j8WesFoQ62uMTq0efS04IhBa6PWtr72s0naQnbEaZG+KSxkKd1XOxpX1ybsPdZCt0hbpYOXmEEkEgm1I7L5B0fMkcs5lC8DAAAAAElFTkSuQmCC'),
)!;
final worldMapTile42 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAYFJREFUOI2VksFKI0EQhj/dEcykGzWErCOThUAQcxD26kH04lXxHdzL3jwoeJPdfQV9jX2EPQj6CEoScCGNk8QIGWsm7i17iNNkzCRonaZr6vv7r6qeGw6Hw4vLXzQaf0kiCLoEDx36obC8pAEoVxb4UinyNpwE/nZ0bJM/fp5hTDtVWKYwAQM4uzuHwG983+fk9DsAnldio1bl7rZJJDFK5zNhgHkgZR9gMHgBYP9gD6XzbH7Nvh3gU++pdb62VuL65g9KuSjlEscDnp8jcrlFYI5m/ZHPqzmWVtxJByIxnU4vlQxDsd9a5/F9b6oDB8CYdgoSiQFw3VwqP1UAsGsD7Orq9Xv0jAECOMYEAESvt27UqqyvV6yASIwxASvFKWv0fY9IIgBqtSqeVxo5CrpEEmFMm63t8uwWlFb0Q0EkRuTeCo7+faAFYwLb/3tjPoGT6I9NvR+KfURKL2Y7GBWMim6uWiidtyLjcKGosgXGD1nDmgUDOIm1SP5NgMBMGOA/lU6auotjXbcAAAAASUVORK5CYII='),
)!;
final worldMapTile43 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAIdJREFUOI1jrKj3/89AAWCiRPOoAaMGwAALOZounv5MugHfP4ow8PJyM7x8+Yahu6uVQUZGhuHJkyeEvXDx9Ge4ZhiQkZFhYGBgYNDW1sZvwMXTn+EaX758w/Dy5RuG/LwqhidPnhDnBWRbubg4GVJTClHkp05rwe0C5IDCBpYsncyQnVXDAABN6SkSZqLBUAAAAABJRU5ErkJggg=='),
)!;
final worldMapTile44 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAJRJREFUOI1jrKj3/89AAWCiRPOoAaMGwADLxdOf4Rx9U16SDWC8cuXKfxkZGYYnT54wTJzUxiAuLsLw+fNXBk7+N0QZwKStrc3AwMDAICMjAxfk5eVm+P5RhAHZdTgNgDGePHnCkJ9XxfDy5RuGly/fwA0iZAjT1GktKAL5eVUMXFycKK7Ba0B2Vg3DkqWT8SrC5woA74wsZzp+8W0AAAAASUVORK5CYII='),
)!;
final worldMapTile45 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAchJREFUOI2dkb9rU1EUxz+Jb4jNuyRD8TXlVShUsGgdzFSkpILg5OCiYIuL6VhsRrfUupYu1qX9W3RoSztlC5G2oNCDL5EIfbkvqVDhOdh7fS9m8rscvt9zvufHvcRXeL+9ESeR5K/XXlk+HB2A7Q/vWF5aJQxDRATf91leWgVgrVYF4OTkK81mk8XK0xR3jGiMBiKCiACwXt+02s7uFivVGgC+73Ot++OsXqk8Ymd3i1szd1Jxf/8Tl5e/ODj4yMPFx/R6PRqNIxqNI9brm4gImWfPn8Sl0g0ABoMLAMbGrqNUHoBOp2s1kzd8pVojq3UfpfLWYGCMnjfOKAwGF7zdeINjij1v3BZ3Ol1E2oShBkDrPr4/kWp4fPyFVusUJ9IRn1uniLRTE0QCfL8EQKQjRNqUy3ftgOBbB4DM9PTN+M+LTuAq1xrOr6YDFAsKwOaTNc7t2Rk7wVV5igVFadLjfnnOrioSUCwoIh2lmgBkTWdzY2nSw/xKEHwn0hGA3chwg8zcvdn471p9u4XBeaitnjzH6Nmk2cTk/cP5pHl+YYrMi5cP7AaHe2f/GOcXphiVN3qqwf/AcVWOSP8cmXRVLsWH61yV4zeuMxxpx4JsMgAAAABJRU5ErkJggg=='),
)!;
final worldMapTile46 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAXxJREFUOI2Vkj1LA0EQhh/FJpc7FBHjyRYKJhhOQbBLo+QPiP8haWIlfmDhN4KVxEYbU2tn/kKChZUipLMJ6MJ5EkRZEwsLLeSWu8CdOtXuDjM77zxvz8bOwhdd8dBs8dj8xB5N6bftrUMAhBBIKanVqyyVNuntLg6GUu3QXQihz/Nzi5ycHsQ3CDY5q5RZWy/psx89URIArq8eAZjMTjA7O4XntTCMBMXCMgCO49AX97sQI5iWiWUlAUilhvC8lp4gnR6LltC4e8G0TDKZcQA8r6Vz/gRAdAMhbP0zgGEktISzSpl0eux3Cn4o1eb2poFhJNjbPQL+QeH+vsm7egfQxYD2QSSFxt0LA/0WAK9vinw+B4T11+rV6AmmZwaR8gkpn8jnc3Q6H3Q6HyEPLJU24zGaVlIv07KSrK7sA2grO44TjzGbnQiRCDrRX2LkBELY2PYwrvsMoBFKKSkWlrWUP2MMIoQfFx6XK/E7cN1nlGqjVJOL88tQzpfwDe2OoAEUykg+AAAAAElFTkSuQmCC'),
)!;
final worldMapTile47 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAaBJREFUOI2Nkk1LG1EUhp+k6WJuMilCzHTKWAyomK2uspCkq679D7rRlYsWCl0kNatKmm4M+PEfRLdu9AdEBA2GTEtdDA6T2i4yE8WITDfOpcYwyQsXDof7Hs45z4n4vu9v1soU8osYhoFlWQB8Wf9EIPvKYSLzkreZFP2KBuZAhmE8+eC63WemJwWCYGe3CsCHjysyHmYGiPi+7zcaDVnk5uYWTUtRr5/TvPgBQG5hAmDgCLHNWhnTvASQZgBVjTObncJzvdFGWF5ak0nHuQZgZiZDQk1wdvo3fIT+LoRQsO02up7Gttu4bpex1N1wCqViBSEUTupnIy0QILq68pmj4z2ZKBUrAHiuR6v1a2iBF+PpWLGQX2R+Lken06HyrYT+RuOi+ZNoJILndmn//oP2WuHVmBi8g36MAEIoHOwfAuEYo4AcoVSssPG1hqalJMaEGg/fQbDE/y8xkKrGyWanQjHGTPMS06yyvLSGZVkIoeA41/KgdD39SORucAffq7tMT0/KRIByVIySQqBkMsm7wnu2t7fo9e7lU8TDQAr/AHFRug3pLV4cAAAAAElFTkSuQmCC'),
)!;
final worldMapTile48 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAALVJREFUOI3tjDEOgkAQRUdit6Gz9wJ0ew5iBwfgAGBHZ8EV4AA22nkRKpK5AxXJGAo7v4WZ1eAaCjrjTyY7++f9vyoPO9ACBUvC/4LfK+jakbp2nA1MuUCN8+lCYWho6A2t71s3Q2/odt1QuT/S0BuyNiJro1dRXmRgZogIRARJGkM9Hb0xs7slaQwAIGaGSiEALqy7iHz4AED4onfI9/cW1E3lhfIi8+51Uz0L6qZy4bl3yj8AsqZC+Mr7khsAAAAASUVORK5CYII='),
)!;
final worldMapTile49 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAB1JREFUOI1jZFmw5T8DBYCJEs2jBowaMGrAYDIAAL+rAndBHiNDAAAAAElFTkSuQmCC'),
)!;
final worldMapTile50 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAB1JREFUOI1j1D6y8j8DBYCJEs2jBowaMGrAYDIAAMNsArdzkqa8AAAAAElFTkSuQmCC'),
)!;
final worldMapTile51 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAB1JREFUOI1jPLkp7T8DBYCJEs2jBowaMGrAYDIAAOxaAwAHESqvAAAAAElFTkSuQmCC'),
)!;
final worldMapTile52 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAJ5JREFUOI3Nk8EKgzAQRMcSSK7Bi+bmt/Tb+iv9rdxMLyUnSQxKPIhLGzQNiNC57GX3MTCz1eN5jzih25njawFKMox+KgcoyehISUYLvyC0qY1HU3MAgAsRr/eIrhUAgN4eQ8gBFwx2mGk2NYcLEdr4Mgep7DATOKc/jvESwGe8RYC9bqS9yAK08XBh/bUt0q4VX06ygJJu5ENOtNeNBd2bR7JNx8EkAAAAAElFTkSuQmCC'),
)!;
final worldMapTile53 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAB1JREFUOI1jbF3m/J+BAsBEieZRA0YNGDVgMBkAABngAo3pFkWtAAAAAElFTkSuQmCC'),
)!;
final worldMapTile54 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAB1JREFUOI1jrKj3/89AAWCiRPOoAaMGjBowmAwAAHeIAmWX+sB7AAAAAElFTkSuQmCC'),
)!;
final worldMapTile55 = decodePng(
  base64.decode(
      'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAB1JREFUOI1j/P///38GCgATJZpHDRg1YNSAwWQAAGvKBByn4XVTAAAAAElFTkSuQmCC'),
)!;

final patternToTile = {
  // [Terrain.snow, Terrain.snow, Terrain.mountains, Terrain.mountains]:
  //     worldMapTile45,
  // [Terrain.mountains, Terrain.mountains, Terrain.mountains, Terrain.mountains]:
  //     worldMapTile54,
  // [Terrain.mountains, Terrain.mountains, Terrain.hills, Terrain.hills]:
  //     worldMapTile37,
  // [Terrain.hills, Terrain.hills, Terrain.grassland, Terrain.grassland]:
  //     worldMapTile37,
  // [Terrain.grassland, Terrain.grassland, Terrain.grassland, Terrain.grassland]:
  //     worldMapTile52,
  // [Terrain.grassland, Terrain.grassland, Terrain.mountains, Terrain.mountains]:
  //     worldMapTile40,
  // [Terrain.snow, Terrain.snow, Terrain.mountains, Terrain.snow]: worldMapTile55,
  // [Terrain.mountains, Terrain.snow, Terrain.mountains, Terrain.mountains]:
  //     worldMapTile41,
  // [Terrain.grassland, Terrain.grassland, Terrain.grassland, Terrain.hills]:
  //     worldMapTile35,
  // [Terrain.grassland, Terrain.hills, Terrain.mountains, Terrain.mountains]:
  //     worldMapTile40,
  // [Terrain.snow, Terrain.snow, Terrain.snow, Terrain.mountains]: worldMapTile55,
  // [Terrain.snow, Terrain.mountains, Terrain.mountains, Terrain.mountains]:
  //     worldMapTile42,
  // [Terrain.mountains, Terrain.mountains, Terrain.hills, Terrain.mountains]:
  //     worldMapTile54,
  // [Terrain.hills, Terrain.mountains, Terrain.grassland, Terrain.hills]:
  //     worldMapTile53,
  // [Terrain.grassland, Terrain.hills, Terrain.grassland, Terrain.grassland]:
  //     worldMapTile33,
  // [Terrain.grassland, Terrain.hills, Terrain.grassland, Terrain.hills]:
  //     worldMapTile38,
  // [Terrain.grassland, Terrain.hills, Terrain.hills, Terrain.mountains]:
  //     worldMapTile40,
  // [Terrain.hills, Terrain.mountains, Terrain.mountains, Terrain.mountains]:
  //     worldMapTile54,
  // [Terrain.hills, Terrain.hills, Terrain.grassland, Terrain.hills]:
  //     worldMapTile53,
  // [Terrain.grassland, Terrain.hills, Terrain.hills, Terrain.hills]:
  //     worldMapTile53,
  // [Terrain.hills, Terrain.hills, Terrain.hills, Terrain.hills]: worldMapTile53,
  // [Terrain.hills, Terrain.hills, Terrain.mountains, Terrain.mountains]:
  //     worldMapTile40,
  // [Terrain.mountains, Terrain.mountains, Terrain.mountains, Terrain.snow]:
  //     worldMapTile43,
  // [Terrain.mountains, Terrain.hills, Terrain.mountains, Terrain.hills]:
  //     worldMapTile39,
  // [Terrain.mountains, Terrain.hills, Terrain.mountains, Terrain.grassland]:
  //     worldMapTile39,
  // [Terrain.mountains, Terrain.grassland, Terrain.mountains, Terrain.hills]:
  //     worldMapTile39,
  // [Terrain.mountains, Terrain.hills, Terrain.hills, Terrain.hills]:
  //     worldMapTile34,
  // [Terrain.hills, Terrain.hills, Terrain.mountains, Terrain.hills]:
  //     worldMapTile53,
  // [Terrain.mountains, Terrain.hills, Terrain.snow, Terrain.mountains]:
  //     worldMapTile44,
  // [Terrain.hills, Terrain.shore, Terrain.hills, Terrain.shore]: worldMapTile32,
  // [Terrain.hills, Terrain.shore, Terrain.grassland, Terrain.shore]:
  //     worldMapTile32,
  // [Terrain.grassland, Terrain.shore, Terrain.hills, Terrain.grassland]:
  //     worldMapTile25,
  // [Terrain.hills, Terrain.grassland, Terrain.hills, Terrain.grassland]:
  //     worldMapTile39,
  // [Terrain.hills, Terrain.grassland, Terrain.mountains, Terrain.hills]:
  //     worldMapTile35,
  // [Terrain.shore, Terrain.deepSea, Terrain.shore, Terrain.deepSea]:
  //     worldMapTile16,
  // [Terrain.shore, Terrain.deepSea, Terrain.shore, Terrain.sea]: worldMapTile14,
  // [Terrain.shore, Terrain.sea, Terrain.grassland, Terrain.sea]: worldMapTile14,
  // [Terrain.grassland, Terrain.sea, Terrain.grassland, Terrain.shore]:
  //     worldMapTile6,
  // [Terrain.grassland, Terrain.shore, Terrain.grassland, Terrain.sea]:
  //     worldMapTile1,
  // [Terrain.grassland, Terrain.shore, Terrain.grassland, Terrain.shore]:
  //     worldMapTile30,
  // [Terrain.deepSea, Terrain.deepSea, Terrain.deepSea, Terrain.deepSea]:
  //     worldMapTile49,
  // [Terrain.deepSea, Terrain.deepSea, Terrain.sea, Terrain.deepSea]:
  //     worldMapTile49,
  // [Terrain.sea, Terrain.deepSea, Terrain.sea, Terrain.deepSea]: worldMapTile22,
  // [Terrain.sea, Terrain.deepSea, Terrain.shore, Terrain.deepSea]:
  //     worldMapTile22,
  // [Terrain.shore, Terrain.deepSea, Terrain.sea, Terrain.deepSea]:
  //     worldMapTile22,
  // [Terrain.sea, Terrain.deepSea, Terrain.shore, Terrain.sea]: worldMapTile17,
  // [Terrain.shore, Terrain.sea, Terrain.sea, Terrain.sea]: worldMapTile50,
  // [Terrain.sea, Terrain.sea, Terrain.shore, Terrain.sea]: worldMapTile50,
  // [Terrain.shore, Terrain.sea, Terrain.shore, Terrain.sea]: worldMapTile50,
  // [Terrain.shore, Terrain.sea, Terrain.grassland, Terrain.shore]: worldMapTile9,
  // [Terrain.sea, Terrain.deepSea, Terrain.sea, Terrain.sea]: worldMapTile17,
  // [Terrain.sea, Terrain.sea, Terrain.sea, Terrain.sea]: worldMapTile50,
  // [Terrain.deepSea, Terrain.deepSea, Terrain.sea, Terrain.sea]: worldMapTile21,
  // [Terrain.sea, Terrain.sea, Terrain.sea, Terrain.deepSea]: worldMapTile19

  // Grass to sea
  [Terrain.grassland, Terrain.grassland, Terrain.grassland, Terrain.sea]:
      worldMapTile1,
  [Terrain.grassland, Terrain.grassland, Terrain.sea, Terrain.grassland]:
      worldMapTile2,
  [Terrain.grassland, Terrain.sea, Terrain.grassland, Terrain.grassland]:
      worldMapTile3,
  [Terrain.sea, Terrain.grassland, Terrain.grassland, Terrain.grassland]:
      worldMapTile4,
  [Terrain.sea, Terrain.sea, Terrain.grassland, Terrain.grassland]:
      worldMapTile5,
  [Terrain.grassland, Terrain.sea, Terrain.grassland, Terrain.sea]:
      worldMapTile6,
  [Terrain.sea, Terrain.grassland, Terrain.sea, Terrain.grassland]:
      worldMapTile7,
  [Terrain.grassland, Terrain.grassland, Terrain.sea, Terrain.sea]:
      worldMapTile8,

  // Shore to sea
  [Terrain.shore, Terrain.sea, Terrain.shore, Terrain.shore]: worldMapTile9,
  [Terrain.sea, Terrain.shore, Terrain.shore, Terrain.shore]: worldMapTile10,
  [Terrain.shore, Terrain.shore, Terrain.shore, Terrain.sea]: worldMapTile11,
  [Terrain.shore, Terrain.shore, Terrain.sea, Terrain.shore]: worldMapTile12,
  [Terrain.sea, Terrain.sea, Terrain.shore, Terrain.shore]: worldMapTile13,
  [Terrain.shore, Terrain.sea, Terrain.shore, Terrain.sea]: worldMapTile14,
  [Terrain.sea, Terrain.shore, Terrain.sea, Terrain.shore]: worldMapTile15,
  [Terrain.shore, Terrain.shore, Terrain.sea, Terrain.sea]: worldMapTile16,

  // Shore to deep sea
  [Terrain.shore, Terrain.deepSea, Terrain.shore, Terrain.shore]: worldMapTile9,
  [Terrain.deepSea, Terrain.shore, Terrain.shore, Terrain.shore]:
      worldMapTile10,
  [Terrain.shore, Terrain.shore, Terrain.shore, Terrain.deepSea]:
      worldMapTile11,
  [Terrain.shore, Terrain.shore, Terrain.deepSea, Terrain.shore]:
      worldMapTile12,
  [Terrain.deepSea, Terrain.deepSea, Terrain.shore, Terrain.shore]:
      worldMapTile13,
  [Terrain.shore, Terrain.deepSea, Terrain.shore, Terrain.deepSea]:
      worldMapTile14,
  [Terrain.deepSea, Terrain.shore, Terrain.deepSea, Terrain.shore]:
      worldMapTile15,
  [Terrain.shore, Terrain.shore, Terrain.deepSea, Terrain.deepSea]:
      worldMapTile16,

  // Sea to deep sea
  [Terrain.sea, Terrain.deepSea, Terrain.sea, Terrain.sea]: worldMapTile17,
  [Terrain.deepSea, Terrain.sea, Terrain.sea, Terrain.sea]: worldMapTile18,
  [Terrain.sea, Terrain.sea, Terrain.sea, Terrain.deepSea]: worldMapTile19,
  [Terrain.sea, Terrain.sea, Terrain.deepSea, Terrain.sea]: worldMapTile20,
  [Terrain.deepSea, Terrain.deepSea, Terrain.sea, Terrain.sea]: worldMapTile21,
  [Terrain.sea, Terrain.deepSea, Terrain.sea, Terrain.deepSea]: worldMapTile22,
  [Terrain.deepSea, Terrain.sea, Terrain.deepSea, Terrain.sea]: worldMapTile23,
  [Terrain.sea, Terrain.sea, Terrain.deepSea, Terrain.deepSea]: worldMapTile24,

  // Grass to shore
  [Terrain.grassland, Terrain.shore, Terrain.grassland, Terrain.grassland]:
      worldMapTile25,
  [Terrain.shore, Terrain.grassland, Terrain.grassland, Terrain.grassland]:
      worldMapTile26,
  [Terrain.grassland, Terrain.grassland, Terrain.grassland, Terrain.shore]:
      worldMapTile27,
  [Terrain.grassland, Terrain.grassland, Terrain.shore, Terrain.grassland]:
      worldMapTile28,
  [Terrain.shore, Terrain.shore, Terrain.grassland, Terrain.grassland]:
      worldMapTile29,
  [Terrain.grassland, Terrain.shore, Terrain.grassland, Terrain.shore]:
      worldMapTile30,
  [Terrain.shore, Terrain.grassland, Terrain.shore, Terrain.grassland]:
      worldMapTile31,
  [Terrain.grassland, Terrain.grassland, Terrain.shore, Terrain.shore]:
      worldMapTile32,

  // Grass to hills
  [Terrain.grassland, Terrain.hills, Terrain.grassland, Terrain.grassland]:
      worldMapTile33,
  [Terrain.hills, Terrain.grassland, Terrain.grassland, Terrain.grassland]:
      worldMapTile34,
  [Terrain.grassland, Terrain.grassland, Terrain.grassland, Terrain.hills]:
      worldMapTile35,
  [Terrain.grassland, Terrain.grassland, Terrain.hills, Terrain.grassland]:
      worldMapTile36,
  [Terrain.hills, Terrain.hills, Terrain.grassland, Terrain.grassland]:
      worldMapTile37,
  [Terrain.grassland, Terrain.hills, Terrain.grassland, Terrain.hills]:
      worldMapTile38,
  [Terrain.hills, Terrain.grassland, Terrain.hills, Terrain.grassland]:
      worldMapTile39,
  [Terrain.grassland, Terrain.grassland, Terrain.hills, Terrain.hills]:
      worldMapTile40,

  // Hills to mountains
  [Terrain.hills, Terrain.mountains, Terrain.hills, Terrain.hills]:
      worldMapTile33,
  [Terrain.mountains, Terrain.hills, Terrain.hills, Terrain.hills]:
      worldMapTile34,
  [Terrain.hills, Terrain.hills, Terrain.hills, Terrain.mountains]:
      worldMapTile35,
  [Terrain.hills, Terrain.hills, Terrain.mountains, Terrain.hills]:
      worldMapTile36,
  [Terrain.mountains, Terrain.mountains, Terrain.hills, Terrain.hills]:
      worldMapTile37,
  [Terrain.hills, Terrain.mountains, Terrain.hills, Terrain.mountains]:
      worldMapTile38,
  [Terrain.mountains, Terrain.hills, Terrain.mountains, Terrain.hills]:
      worldMapTile39,
  [Terrain.hills, Terrain.hills, Terrain.mountains, Terrain.mountains]:
      worldMapTile40,

  // Mountains to snow
  [Terrain.mountains, Terrain.snow, Terrain.mountains, Terrain.mountains]:
      worldMapTile41,
  [Terrain.snow, Terrain.mountains, Terrain.mountains, Terrain.mountains]:
      worldMapTile42,
  [Terrain.mountains, Terrain.mountains, Terrain.mountains, Terrain.snow]:
      worldMapTile43,
  [Terrain.mountains, Terrain.mountains, Terrain.snow, Terrain.mountains]:
      worldMapTile44,
  [Terrain.snow, Terrain.snow, Terrain.mountains, Terrain.mountains]:
      worldMapTile45,
  [Terrain.mountains, Terrain.snow, Terrain.mountains, Terrain.snow]:
      worldMapTile46,
  [Terrain.snow, Terrain.mountains, Terrain.snow, Terrain.mountains]:
      worldMapTile47,
  [Terrain.mountains, Terrain.mountains, Terrain.snow, Terrain.snow]:
      worldMapTile48,

  // Single tiles
  [Terrain.deepSea, Terrain.deepSea, Terrain.deepSea, Terrain.deepSea]:
      worldMapTile49,
  [Terrain.sea, Terrain.sea, Terrain.sea, Terrain.sea]: worldMapTile50,
  [Terrain.shore, Terrain.shore, Terrain.shore, Terrain.shore]: worldMapTile51,
  [Terrain.grassland, Terrain.grassland, Terrain.grassland, Terrain.grassland]:
      worldMapTile52,
  [Terrain.hills, Terrain.hills, Terrain.hills, Terrain.hills]: worldMapTile53,
  [Terrain.mountains, Terrain.mountains, Terrain.mountains, Terrain.mountains]:
      worldMapTile54,
  [Terrain.snow, Terrain.snow, Terrain.snow, Terrain.snow]: worldMapTile55,

  // Extras
  [Terrain.snow, Terrain.mountains, Terrain.snow, Terrain.snow]: worldMapTile55,
  [Terrain.snow, Terrain.snow, Terrain.snow, Terrain.mountains]: worldMapTile55,
  [Terrain.hills, Terrain.hills, Terrain.shore, Terrain.shore]: worldMapTile32,
  [Terrain.mountains, Terrain.mountains, Terrain.hills, Terrain.grassland]:
      worldMapTile37,
  [Terrain.hills, Terrain.grassland, Terrain.shore, Terrain.shore]:
      worldMapTile32,
  [Terrain.shore, Terrain.shore, Terrain.deepSea, Terrain.sea]: worldMapTile16,
  [Terrain.deepSea, Terrain.sea, Terrain.deepSea, Terrain.deepSea]:
      worldMapTile49,
  [Terrain.mountains, Terrain.mountains, Terrain.grassland, Terrain.hills]:
      worldMapTile37,
  [Terrain.grassland, Terrain.hills, Terrain.shore, Terrain.grassland]:
      worldMapTile33,
  [Terrain.shore, Terrain.grassland, Terrain.sea, Terrain.sea]: worldMapTile16,
  [Terrain.mountains, Terrain.hills, Terrain.mountains, Terrain.mountains]:
      worldMapTile54,
  [Terrain.grassland, Terrain.grassland, Terrain.sea, Terrain.shore]:
      worldMapTile12,
  [Terrain.sea, Terrain.shore, Terrain.deepSea, Terrain.deepSea]:
      worldMapTile24,
  [Terrain.hills, Terrain.grassland, Terrain.mountains, Terrain.hills]:
      worldMapTile36,
  [Terrain.grassland, Terrain.grassland, Terrain.shore, Terrain.sea]:
      worldMapTile11,
  [Terrain.shore, Terrain.sea, Terrain.deepSea, Terrain.deepSea]:
      worldMapTile22,
  [Terrain.hills, Terrain.grassland, Terrain.hills, Terrain.hills]:
      worldMapTile52,
  [Terrain.sea, Terrain.shore, Terrain.deepSea, Terrain.sea]: worldMapTile20,
  [Terrain.grassland, Terrain.hills, Terrain.hills, Terrain.hills]:
      worldMapTile52,
  [Terrain.shore, Terrain.sea, Terrain.sea, Terrain.sea]: worldMapTile50,
  [Terrain.sea, Terrain.shore, Terrain.sea, Terrain.sea]: worldMapTile50,
  [Terrain.grassland, Terrain.hills, Terrain.hills, Terrain.mountains]:
      worldMapTile35,
  [Terrain.grassland, Terrain.mountains, Terrain.grassland, Terrain.mountains]:
      worldMapTile38,
  [Terrain.grassland, Terrain.mountains, Terrain.hills, Terrain.mountains]:
      worldMapTile38,
  [Terrain.hills, Terrain.mountains, Terrain.mountains, Terrain.mountains]:
      worldMapTile54,
  [Terrain.mountains, Terrain.snow, Terrain.hills, Terrain.mountains]:
      worldMapTile41,
  [Terrain.hills, Terrain.mountains, Terrain.grassland, Terrain.hills]:
      worldMapTile33,
  [Terrain.shore, Terrain.grassland, Terrain.sea, Terrain.shore]:
      worldMapTile12,
  [Terrain.mountains, Terrain.hills, Terrain.snow, Terrain.mountains]:
      worldMapTile41,
  [Terrain.snow, Terrain.snow, Terrain.mountains, Terrain.snow]: worldMapTile55,
  [Terrain.hills, Terrain.hills, Terrain.hills, Terrain.grassland]:
      worldMapTile52,
  [Terrain.shore, Terrain.sea, Terrain.grassland, Terrain.shore]: worldMapTile9,
  [Terrain.grassland, Terrain.grassland, Terrain.hills, Terrain.mountains]:
      worldMapTile35,
  [Terrain.mountains, Terrain.snow, Terrain.snow, Terrain.snow]: worldMapTile55,
  [Terrain.sea, Terrain.sea, Terrain.shore, Terrain.sea]: worldMapTile50,
  [Terrain.shore, Terrain.sea, Terrain.grassland, Terrain.grassland]:
      worldMapTile9,
  [Terrain.grassland, Terrain.grassland, Terrain.mountains, Terrain.hills]:
      worldMapTile36,
  [Terrain.sea, Terrain.deepSea, Terrain.deepSea, Terrain.deepSea]:
      worldMapTile49,
  [Terrain.deepSea, Terrain.deepSea, Terrain.sea, Terrain.deepSea]:
      worldMapTile49,
  [Terrain.sea, Terrain.sea, Terrain.grassland, Terrain.shore]: worldMapTile13,
  [Terrain.grassland, Terrain.shore, Terrain.hills, Terrain.grassland]:
      worldMapTile25,
  [Terrain.sea, Terrain.deepSea, Terrain.shore, Terrain.sea]: worldMapTile17,
  [Terrain.hills, Terrain.hills, Terrain.grassland, Terrain.hills]:
      worldMapTile52,
  [Terrain.shore, Terrain.grassland, Terrain.sea, Terrain.grassland]:
      worldMapTile12,
  [Terrain.sea, Terrain.grassland, Terrain.sea, Terrain.shore]: worldMapTile15,
  [Terrain.shore, Terrain.shore, Terrain.shore, Terrain.grassland]:
      worldMapTile51,
  [Terrain.shore, Terrain.shore, Terrain.grassland, Terrain.shore]:
      worldMapTile51,
  [Terrain.shore, Terrain.grassland, Terrain.shore, Terrain.shore]:
      worldMapTile51,
  [Terrain.grassland, Terrain.shore, Terrain.shore, Terrain.shore]:
      worldMapTile51,
  [Terrain.mountains, Terrain.mountains, Terrain.hills, Terrain.mountains]:
      worldMapTile54,
  [Terrain.sea, Terrain.sea, Terrain.sea, Terrain.shore]: worldMapTile50,
  [Terrain.sea, Terrain.shore, Terrain.shore, Terrain.grassland]:
      worldMapTile10,
  [Terrain.sea, Terrain.sea, Terrain.shore, Terrain.grassland]: worldMapTile15,
  [Terrain.deepSea, Terrain.deepSea, Terrain.deepSea, Terrain.sea]:
      worldMapTile49,
  [Terrain.deepSea, Terrain.sea, Terrain.sea, Terrain.shore]: worldMapTile18,
  [Terrain.sea, Terrain.shore, Terrain.grassland, Terrain.grassland]:
      worldMapTile10,
  [Terrain.hills, Terrain.mountains, Terrain.grassland, Terrain.grassland]:
      worldMapTile33,
  [Terrain.hills, Terrain.mountains, Terrain.mountains, Terrain.snow]:
      worldMapTile43,
  [Terrain.mountains, Terrain.mountains, Terrain.grassland, Terrain.grassland]:
      worldMapTile37,
  [Terrain.hills, Terrain.grassland, Terrain.mountains, Terrain.mountains]:
      worldMapTile40,
  [Terrain.snow, Terrain.mountains, Terrain.mountains, Terrain.snow]:
      worldMapTile55,
  [Terrain.mountains, Terrain.snow, Terrain.grassland, Terrain.hills]:
      worldMapTile37,
  [Terrain.snow, Terrain.mountains, Terrain.hills, Terrain.mountains]:
      worldMapTile54,
  [Terrain.grassland, Terrain.hills, Terrain.hills, Terrain.snow]:
      worldMapTile35,
  [Terrain.hills, Terrain.hills, Terrain.snow, Terrain.snow]: worldMapTile38,
  [Terrain.hills, Terrain.grassland, Terrain.snow, Terrain.hills]:
      worldMapTile36,
  [Terrain.grassland, Terrain.shore, Terrain.shore, Terrain.sea]:
      worldMapTile11,
};
