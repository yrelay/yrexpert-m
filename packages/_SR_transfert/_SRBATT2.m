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

;%SRBATT2^INT^1^59547,73891^0
%SRBATT2 ;;09:43 AM  24 Mar 1993; 08 Jan 93  4:47 PM ; 29 Sep 93  4:37 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
SAISIE(REPART,ART,ATT1,vsm,ATT2,vsM,titre,PREMX,DERX,REPCODE,INDCODE,ATTCODE) 
 N GSTO,e,em,eM,PMAX,I
 
 N FIXE1
 S FIXE1=0
 G COMMUN
 
 
OLD(REPART,ART,ATT1,ATT2,FIXE1,titre,PREMX,DERX,REPCODE,INDCODE,ATTCODE) 
 N GSTO,e,em,eM,PMAX
 
 N vsm,vsM
 S vsm=0,vsM=100000
 
COMMUN 
 S PMAX=DERX-PREMX
 S e=$$TEMP^%SGUTIL,em=$$TEMP^%SGUTIL,eM=$$TEMP^%SGUTIL
 F I=1:1:PMAX S v=$$^%QSCALIN(REPART,ART,ATT1,(I+PREMX)-1) S:v'="" @em@(I)=v S v=$$^%QSCALIN(REPART,ART,ATT2,(I+PREMX)-1) S:v'="" @eM@(I)=v
 D MATRICE(e,em,eM,titre,vsm,vsM)
 F I=1:1:PMAX D PA^%QSGESTI(REPART,ART,ATT1,@em@(I),(I+PREMX)-1),PA^%QSGESTI(REPART,ART,ATT2,@eM@(I),(I+PREMX)-1)
 Q
 
MATRICE(e,em,eM,titre,vsm,vsM) 
 
 
 
 
 
 
 
 
 
 
 
 
 N MATAF,CARMAT,TAIPAG,MENG,%II,PAGECOUR,SEMDPAGE,PERDP,TAIPAGE
 N TAIPCOUR,IDBPAGE
 S MATAF=$$TEMP^%SGUTIL
 S CARMAT=$$TEMP^%SGUTIL
 S MENG=$$TEMP^%SGUTIL
 
 S @CARMAT@("NBC")=3,@CARMAT@("TITRE")=titre
 S @CARMAT@("LGCOL",2)=12,@CARMAT@("LGCOL",3)=12
 S @CARMAT@("CG")=30,@CARMAT@("LH")=5,@CARMAT@("NOMODC",1)=""
 S:FIXE1 @CARMAT@("NOMODC",2)=""
 
 
 F %II=1:1:PMAX S:'($D(@em@(%II))) @em@(%II)=vsm S:'($D(@eM@(%II))) @eM@(%II)=vsM
 S IDBPAGE=0,TAIPAGE=10,PAGECOUR=1,SEMDPAGE=1,PERDP=0
 
DEFMEN S @MENG="16^30^60"
 S @MENG@(1)=$$^%QZCHW("+")_"^PLUS",@MENG@(1,"COM")=$$^%QZCHW("page suivante"),@MENG@(2)=$$^%QZCHW("-")_"^MOINS",@MENG@(2,"COM")=$$^%QZCHW("page precedente")
 S @MENG@(3)=$$^%QZCHW("modifier")_"^MODIF",@MENG@(3,"COM")=$$^%QZCHW("modifier les valeurs de cette page"),@MENG@(4)=$$^%QZCHW("FIN")_"^FIN",@MENG@(4,"COM")=$$^%QZCHW("fin")
 
 D CLFEN^%VVIDEO(15,4,14,60)
 
AFF S TAIPCOUR=$S((PMAX-IDBPAGE)<TAIPAGE:PMAX-IDBPAGE,1:TAIPAGE)
 
 K @(MATAF) F %II=1:1:TAIPCOUR D MAKELIG
 
 S @CARMAT@("NBL")=TAIPCOUR D ^%PKPOPM(MATAF,CARMAT,0)
 
MEN D ^%VQUIKMN(30,80,17,MENG,.ADRES,.CONTR) G:(CONTR="A")!(CONTR="F") FIN G:ADRES'="" @ADRES G MEN
 
MODIF D ^%PKPOPM(MATAF,CARMAT,1)
 
 F %ii=1:1:TAIPCOUR S @em@(%ii+IDBPAGE)=@MATAF@(%ii,2),@eM@(%ii+IDBPAGE)=@MATAF@(%ii,3)
 G MEN
 
PLUS I (IDBPAGE+TAIPAGE)'<PMAX D ^%VSQUEAK G MEN
 S IDBPAGE=IDBPAGE+TAIPAGE,PERDP=PERDP+TAIPAGE
 D CLFEN^%VVIDEO(15,4,13,60)
 G AFF
 
MOINS I IDBPAGE=0 D ^%VSQUEAK G MEN
 S IDBPAGE=IDBPAGE-TAIPAGE,PERDP=PERDP-TAIPAGE
 D CLFEN^%VVIDEO(15,4,13,60)
 G AFF
 
FIN K @(MATAF),@(CARMAT),@(MENG)
 D CLFEN^%VVIDEO(15,4,14,60)
 Q
 
MAKELIG 
 S @MATAF@(%II,1)=$S(REPCODE="":((PERDP+%II)+PREMX)-1,1:$$GET(((PERDP+%II)+PREMX)-1))
 S @MATAF@(%II,2)=@em@(IDBPAGE+%II)
 S @MATAF@(%II,3)=@eM@(IDBPAGE+%II)
 Q
 
GET(i) N V
 S V=$$^%QSCALIN(REPCODE,INDCODE,ATTCODE,i)
 D:'($D(^[QUI]RQSDON("REMATDAT",REPCODE,ATTCODE))) SETREM^%QMDAUC(REPCODE,ATTCODE)
 Q:'(^[QUI]RQSDON("REMATDAT",REPCODE,ATTCODE)) V
 Q $$AFFI^%QMDAUC(REPCODE,ATTCODE,V)
 ;

