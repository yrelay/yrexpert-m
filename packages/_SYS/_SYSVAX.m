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

;%SYSVAX^INT^1^59547,74027^0
%SYSVAX ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 n rou,rout,glo,glob,oldglob,numjob,nujob,cpu,cputime,oldcpu,deltac,deltag,lin,line,lines,ratio,time,%saut,%imp,%term,ind1,ind2,ind3,ind4,ind5,ind6,ind7,ind8,oldind1,oldind2
 d CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("Scrutation des temps CPU"))
 s DX=10,DY=8 d CLEBAS^%VVIDEO s nb=$$^%VZAME1($$^%QZCHW("nombre d'iteration de scrutation svp 500 =>")) s:nb="" nb=500 k ^cputot($i),^glob($i),^cpu($i),^glotot($i),^cputime($i)
 
 s DX=10,DY=11 d POCLEPA^%VVIDEO s scrt=$$MES^%VZEOUI($$^%QZCHW("Scrutation de tous les job ? "),"O")
 s DX=10,DY=11
recnj g:scrt=1 tous w ! s numjob=$$^%VZAME1($$^%QZCHW("Numero du job ?")) q:numjob=""  g unseul
 q
 
tous d CLEBAS^%VVIDEO,MSG^%VZEATT($$^%QZCHW("Un instant..."))
 f z1=0:1:nb s j="" f z=0:0 s j=$zjob(j) q:j=""  w *
 d total
 q
 
unseul 
 i numjob="?" d CLEPAG^%VVIDEO,^%SS w ! g recnj
 d CLEBAS^%VVIDEO,MSG^%VZEATT($$^%QZCHW("Un instant...")) s j=$$HD^%QZNBCV(numjob)
 f z1=0:1:nb w *
 d total
 q
 
count q:z1=0  q:oldcpu(j)=^cpu($i,j)  s deltac(j)=^cpu($i,j)-oldcpu(j),deltag(j)=^glob($i,j)-oldglob(j) i rout'="" s ^cputot($i,j,rout)=$s('($d(^cputot($i,j,rout))):1,1:^cputot($i,j,rout)+1)
 i '($d(^cputime($i,j,rout))) s ^cputime($i,j,rout)=0
 i '($d(^glotot($i,j,rout))) s ^glotot($i,j,rout)=0
 s ^cputime($i,j,rout)=^cputime($i,j,rout)+deltac(j),^glotot($i,j,rout)=^glotot($i,j,rout)+deltag(j)
 q
total 
 s lin=0,ratio=0,time=0,glo=0
 s nujob="" f q=0:0 s nujob=$o(^cputot($i,nujob)) q:nujob=""  s rou="" f r=0:0 s rou=$o(^cputot($i,nujob,rou)) q:rou=""  d somme
 d CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("Affichage des resultats"))
 d MSG^%VZEATT($$^%QZCHW("Un instant..."))
 s DX=10,DY=11 x XY w $$^%QZCHW("Impression sur ") s sor=$$^%VZESOR("E") q:sor=-1
 s ind1=$o(^cputot($i,"")),ind2=$o(^cputot($i,ind1,""))
 s oldind1=ind1
 d MSG^%VZEATT($$^%QZCHW("Un instant..."))
 i sor=0 d impecr
 i sor=1 d impimp
 q
somme s lin=lin+1,ratio=ratio+^cputot($i,nujob,rou),time=time+^cputime($i,nujob,rou),glo=glo+^glotot($i,nujob,rou) q
aff i oldind1'="" s oldind1=$$DH^%QZNBCV(ind1)
 s ind3=^cputot(%term,ind1,ind2),ind4=100*(ind3/ratio),ind5=^cputime(%term,ind1,ind2),ind6=100*(ind5/time),ind7=^glotot(%term,ind1,ind2),ind8=100*(ind7/glo)
 w !,oldind1,?10,ind2,?20,ind3,?30,$j(ind4,5,2),?40,ind5,?50,$j(ind6,5,2),?60,ind7,?70,$j(ind8,5,2)
 q:lines=lin
 s oldind1=ind1
 s ind2=$o(^cputot(%term,ind1,ind2)) i ind2="" s ind1=$o(^cputot(%term,ind1)),ind2=$o(^cputot(%term,ind1,""))
 i ind1=oldind1 s oldind1="" e  w *
 q
impecr 
 d CLEPAG^%VVIDEO,titre s %term=$i
 f lines=1:1:lin d aff i (lines=25)#25 h 10 d CLEPAG^%VVIDEO,titre
fin h 10 d CLEPAG^%VVIDEO s retour=$$MES^%VZEOUI($$^%QZCHW("Voulez-vous refaire une scrutation ? "),"N") i retour=1 d %SYSVAX
 q
impimp 
 d MSG^%VZEATT($$^%QZCHW("Impression en cours...")) s %term=$i
 s %imp=^TABIDENT(WHOIS,"PRINTER"),%saut=^TABIDENT(WHOIS,"IMPRCOUR") o %imp u %imp w # d titre
 f lines=1:1:lin u %imp d aff i (lines=%saut)#%saut w # d titre
 c %imp d fin
 q
titre w !,"Nb Job",?10,"Routine",?20,"Nb util.",?30,"% Util.",?40,"Tps (ms)",?50,"% Tps",?60,"Acc. GL",?70,"% N Ac GL"
 w !,!
 q

