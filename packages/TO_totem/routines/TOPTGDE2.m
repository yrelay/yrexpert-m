;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;TOPTGDE2^INT^1^59547,74874^0
TOPTGDES ;
 
 d CLEPAG^%VVIDEO,^%PBPZCLR,^%PBPZGRA w *27,*12
BEG k ^PTL($j) d ^PTCADRE s %9CPT=0,%9EEE=0
CHOIELEM w ! s %9MSGE="(P)OINT (D)ROITE (A)RC DE CERC. (L)IGNE SPE. (C)ERCLE (F)IN" d ^PTPADLG w !
LECCURGR w ! d ^PTPOSCUR
 g:((((((%9EE=80)!(%9EE=68))!(%9EE=70))!(%9EE=76))!(%9EE=67))!(%9EE=65))!(%9EE=65) @%9EE d ^%VSQUEAK g CHOIELEM
70 s %9CPT=%9CPT+1,^PTTYPE($j,%9CPT)="FIN" k ^PTTYPE($j),^PTL($j),^%PBPZ($j),%9NOM,%9CPT,%9Y1S,%9E,%9Y2S,%9X1S,%9X2S,%9EE,%9EEE,%9MSGE q
76 d ^PTTYPLIN s ^%PBPZ($j,"X1",%9CPT+1)=%9TL g CHOIELEM
73(OU77) s %9CPT=%9CPT+1,^PTTYPE($j,%9CPT)=$c(%9EE) d ^PTDESELI g CHOIELEM
65 s %9CPT=%9CPT+1,^PTTYPE($j,%9CPT)=$c(%9EE) s:$d(%9TY) ^%PBPZ($j,"X1",%9CPT)=%9TY d ^PTARCERC g CHOIELEM
67 s %9CPT=%9CPT+1,^PTTYPE($j<%9CPT)=$c(%9EE) s:$d(%9TY) ^%PBPZ($j,"X1",%9CPT)=%9TY d ^PTCERCLE g CHOIELEM
84 s %9CPT=%9CPT+1,^PTTYPE($j,%9CPT)=$c(%9EE) d ^PTPOSTEX g CHOIELEM
79 g:%9CPT=0 LECCURGR d ^PTSYMTRI g CHOIELEM
89 g:%9CPT=0 LECCURGR d ^PTSYMTRI g CHOIELEM
88 g:%9CPT=0 LECCURGR d ^PTSYMTRI g CHOIELEM
69 g:%9CPT=0 LECCURGR i %9CPT=1 w *27,"OW b` @@",! d ^PTDESPTS w *27,"OW `` @@",! s %9CPT=%9CPT-1 g LECCURGR
 g:^PTTYPE($j,%9CPT)="" EFFCER w *27,"OW b` @@",! d PTTRADTE w *27,"OW `` @@",! s %9CPT=%9CPT-1,%9Y1S=^PTL($j,%9CPT,1),%9E=^PTL($j,%9CPT,2),%9Y2S=^PTL($j,%9CPT,3),%9X1S=^PTL($j,%9CPT,4),%9X2S=^PTL($j,%9CPT,5) d ^PTDESPTS w ! g LECCURGR
80 d CALCORD,^PTDESPTS s ^PTTYPE($j,%9CPT)=$c(%9EE),^PTL($j,%9CPT,1)=%9Y1S,^PTL($j,%9CPT,2)=%9E,^PTL($j,%9CPT,3)=%9Y2S,^PTL($j,%9CPT,4)=%9X1S,^PTL($j,%9CPT,5)=%9X2S,%9EG="POINT",%9XD=%9X,%9YD=%9Y d ^PTLIBPTS,^PTSTOVAR g CHOIELEM
68 d CALCORD g:%9CPT=0 LECCURGR d ^PTTRADTE s ^PTTYPE($j,%9CPT)=$c(%9EE),^PTL($j,%9CPT,1)=%9Y1S,^PTL($j,%9CPT,2)=%9E,^PTL($j,%9CPT,3)=%9Y2S,^PTL($j,%9CPT,4)=%9X1S,^PTL($j,%9CPT,5)=%9X2S
 s:$d(%9TY) ^%PBPZ($j,"X1",%9CPT)=%9TY d ^PTLIBDTE g CHOIELEM
EFFCER s %9X=^%PBPZ($j,"X",%9CPT),%9Y=^%PBPZ($j,"Y",%9CPT),%9CPT=%9CPT-1 d ^%PBCACO w *27,"OW b` @@",! d TRACE^PTDESCER w *27,"OW `` @@",! s %9CPT=%9CPT-1 g LECCURGR
CALCORD s %9EEE=0,%9CPT=%9CPT+1,^%PBPZ($j,"X",%9CPT)=%9X,^%PBPZ($j,"Y",%9CPT)=%9Y d ^%PBCACO q

