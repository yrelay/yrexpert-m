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

;%QSQUEST^INT^1^59547,73883^0
%QSQUEST(REQ,INIT) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 S ROUTREAF="REAFBIS^%QSQUEST" G:'(INIT) AFF
INIT S COMM="",BASE="",DEJACONT=0,DEJAVARI=0 K CONT,LVAR,VAR
 S P1=-1,NOLV=1,NOLC=1
AFF D REAFF
L0 D HELP
 F I=1,6,10,18,"COMMENTAIRE","REPERTOIRE","CRITERES","CHEMINS INTERMEDIAIRES" G:I=BID @$P(I," ",1)
 D ^%VSQUEAK G L0
1 S OK=1 G 6
6 N TEMPO,PAR
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPO)
 K ^[QUI]RQS1(REQ)
 S ^[QUI]RQS1(REQ,"BASE")=BASE,^[QUI]RQS1(REQ,"COMM")=COMM
 F I=1:1 Q:'($D(VAR(I)))  S ^[QUI]RQS1(REQ,"VARIABLES",I)=VAR(I),^[QUI]RQS1(REQ,"VARIABLES",I,"TETE")=VAR(I,"TETE")
 F I=1:1 Q:'($D(CONT(I)))  S ^[QUI]RQS1(REQ,"CONTRAINTES",I)=CONT(I),^[QUI]RQS1(REQ,"CONTRAINTES",I,"TETE")=CONT(I,"TETE"),^[QUI]RQS1(REQ,"CONTRAINTES",I,"TABATT")=CONT(I,"TABATT")
 S I=-1 F %I=0:0 S I=$N(LVAR(I)) Q:I=-1  S ^[QUI]RQS1(REQ,"LVAR",I)=LVAR(I)
 D CHERCHPAR^%QSQUES2
 
 S I="" F %I=0:0 S I=$O(@TEMPO@(I)) Q:I=""  S PAR=@TEMPO@(I),^[QUI]RQS1(REQ,"PARAMETRES",I)=PAR
 K @(TEMPO)
 S ^[QUI]RQS1(REQ,"DATE.CREATION")=$H
 S ^[QUI]RQS1(REQ,"ACTIVATIONS")=0
 D PA^%QSGESTI("RQS",REQ,"NOM",REQ,1),PA^%QSGESTI("RQS",REQ,"COMM",COMM,1)
 D PA^%QSGESTI("RQS",REQ,"OBJET",BASE,1),PA^%QSGESTI("RQS",REQ,"AUTEUR",WHOIS,1)
 D PA^%QSGESTI("RQS",REQ,"SITE",$I,1),PA^%QSGESTI("RQS",REQ,"LISTE.ATTRIBUTS",$$^%QSLISTA(REQ),1)
 D PA^%QSGESTI("RQS",REQ,"DATE.CREATION",$$DATE^%QMDATE,1),PA^%QSGESTI("RQS",REQ,"HEURE.CREATION",$$HEURE^%QMDATE,1)
 S OK=1 G FIN
10 
 D ^%QSQUESI G L0
18 D REAFF G L0
CHEMINS 
 D AFF86(1),^%QSQUES3,AFF86(0) G L0
CRITERES 
 D AFF67(1),^%QSQUES2,AFF67(0) G L0
COMMENTAIRE 
 D AFCOM(1),^%QSQUES4,AFCOM(0) G L0
REPERTOIRE 
 D AFF66(1),^%QSQUES1,AFF66(0) G L0
 
FIN K BID,CONCUR,DEJACONT,DEJAVARI,DX,I,%IL,LBA,P1,PCH,PCHCOMP,Y1 Q
 
CAD D ^%VZCD(0,79,0,2,0,0,REQ)
 D AFCOM(0),AFF66(0),AFF86(0),AFF67(0) Q
 
AFCOM(BLD) D CARSP^%VVIDEO(0,3,3,80,BLD),BLD^%VVIDEO
 N L
 S L=$$^%QZCHW(" Commentaire ")
 S DX=5,DY=3 X XY W L
 D NORM^%VVIDEO Q
AFF66(BLD) D CARSP^%VVIDEO(50,6,3,30,1)
 D CARSP^%VVIDEO(50,9,3,30,BLD)
 D BLD^%VVIDEO S DX=55,DY=7 X XY W $$^%QZCHW(" Repertoire ")
 D NORM^%VVIDEO Q
AFF86(BLD) D CARSP^%VVIDEO(0,6,6,50,BLD),BLD^%VVIDEO
 N L
 S L=$$^%QZCHW(" Chemins intermediaires ")
 S DX=(50-$L(L))\2,DY=6 X XY W L
 D NORM^%VVIDEO Q
AFF67(BIS) D CARSP^%VVIDEO(0,12,11,80,0),BLD^%VVIDEO
 N L
 S L=$$^%QZCHW(" Criteres de selection ")
 S DX=(79-$L(L))\2,DY=12 X XY W L
 D NORM^%VVIDEO Q
 
HELP S TABC(1)="COMMENTAIRE",TABC(2)="REPERTOIRE",TABC(3)="CRITERES",TABC(4)="CHEMINS INTERMEDIAIRES"
 D POCLEPA^%VVIDEO S BID=$$^%VZECHO("TABC") Q
 
REAFF D CLEPAG^%VVIDEO,CAD
 S DX=52,DY=10 X XY W BASE
 D AFF^%VREAD("",COMM,1,78,5,3)
 D REAFV,REAFC Q
REAFV N X S DX=2,X=NOLV
 F DY=7:1:10 X XY W $J("",46) I X'=-1 X XY W:$D(VAR(X)) VAR(X) S X=X+1
 Q
REAFC N X S DX=2,X=NOLC
 F DY=13:1:21 X XY W $J("",76) I X'=-1 X XY W:$D(CONT(X)) CONT(X) S X=X+1
 Q
 
REAFBIS 
 D REAFF,REAFF^%AN7 Q
 
CREEREQ(REQ) 
 S ^[QUI]RQS1(REQ,"DATE.CREATION")=$H
 S:'($D(^[QUI]RQS1(REQ,"ACTIVATIONS"))) ^[QUI]RQS1(REQ,"ACTIVATIONS")=0
 D PA^%QSGESTI("RQS",REQ,"NOM",REQ,1)
 D PA^%QSGESTI("RQS",REQ,"COMM",^[QUI]RQS1(REQ,"COMM"),1)
 D PA^%QSGESTI("RQS",REQ,"OBJET",^[QUI]RQS1(REQ,"BASE"),1)
 D PA^%QSGESTI("RQS",REQ,"AUTEUR",WHOIS,1)
 D PA^%QSGESTI("RQS",REQ,"SITE",$I,1)
 D PA^%QSGESTI("RQS",REQ,"LISTE.ATTRIBUTS",$$^%QSLISTA(REQ),1)
 D PA^%QSGESTI("RQS",REQ,"DATE.CREATION",$$DATE^%QMDATE,1)
 D PA^%QSGESTI("RQS",REQ,"HEURE.CREATION",$$HEURE^%QMDATE,1)
 D CREER^%TLQUER("q."_REQ)
 Q

