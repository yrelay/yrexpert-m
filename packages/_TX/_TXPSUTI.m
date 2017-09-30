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

;%TXPSUTI^INT^1^59547,74033^0
%TXPSUTI ;;08:28 PM  19 Mar 1993; ; 22 Mar 93  2:59 PM
 
 
 
 
 
 
 
 
 
 
 
MATRICE(e,em,eM,titre,vsm,vsM) 
 
 
 
 
 
 
 
 
 
 
 
 
 N MATAF,CARMAT,TAIPAG,MENG,%II,PAGECOUR,SEMDPAGE,PERDP,TAIPAGE
 N TAIPCOUR,IDBPAGE
 S MATAF=$$TEMP^%SGUTIL
 S CARMAT=$$TEMP^%SGUTIL
 S MENG=$$TEMP^%SGUTIL
 
 S %DS=$$PERM^%QMDATE(@etu@("Date de Depart")) D INT^%QMDAUT2
 I '($D(^[QUI]switchsem)) D totale^%TXPGSEM(%DN) S ^[QUI]switchsem=$H
 D gooday^%TXPGSEM(%DN) S s=sem
 S @CARMAT@("NBC")=3,@CARMAT@("TITRE")=titre
 S @CARMAT@("CG")=30,@CARMAT@("LH")=5,@CARMAT@("NOMODC",1)=""
 
 
 F %II=1:1:PMAX S:'($D(@em@(%II))) @em@(%II)=vsm S:'($D(@eM@(%II))) @eM@(%II)=vsM
 S IDBPAGE=0,TAIPAGE=10,PAGECOUR=1,SEMDPAGE=s,PERDP=^[QUI]periode(s)-1
 
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
 
 
MAKELIG S s=^[QUI]semaine(PERDP+%II)
 S @MATAF@(%II,1)="Semaine "_s_$S($D(@e@(IDBPAGE+%II)):"("_@e@(IDBPAGE+%II)_")",1:"")
 S @MATAF@(%II,2)=@em@(IDBPAGE+%II)
 S @MATAF@(%II,3)=@eM@(IDBPAGE+%II)
 Q
 
 
 
LINEUP I $D(^TXPMODE($J,"arbo")),^TXPMODE($J,"arbo")=1 Q
 N msg,i,VAL S msg="" F i=1:1:78 S msg=msg_""
 I ARTICLE'="" S VAL=$S((ATELIER'="")&(ETUDE'=""):$S($D(@etuata@("Valeur Jauge")):@etuata@("Valeur Jauge"),1:VLIMI),ETUDE'="":$S($D(@etu@("Valeur")):@etu@("Valeur"),1:VLIMI),1:VLIMI) G LF
 I ATELIER'="" S VAL=$S(ETUDE'="":$S($D(@etuat@("Valeur Atelier")):@etuat@("Valeur Atelier"),1:VLIMI),1:VLIMI) G LF
 S VAL=$S(ETUDE'="":$S($D(@etu@("Valeur")):@etu@("Valeur"),1:VLIMI),1:VLIMI)
LF S $E(msg,3,24)=ETUDE,$E(msg,25,45)=":"_ATELIER,$E(msg,46,65)=":"_ARTICLE,$E(msg,66,78)=":V="_(VAL\1),$E(msg,79,80)="   "
 D ^%VZCD(0,78,0,2,0,0,$E(msg,3,78))
 Q
 
 
 N VA,%A,V,ARTICLE
 S VA=0
 S ARTICLE="" F %A=0:0 S ARTICLE=$O(@etuatag@(ARTICLE)) Q:ARTICLE=""  S V=$S($D(@etuata@("Valeur Jauge")):@etuata@("Valeur Jauge"),1:VLIMI),VA=VA+V I VA'<VLIMI S VA=VLIMI Q
 S @etuat@("Valeur Atelier")=VA
 Q
 
VALATE(ETUDE,ATELIER) 
 N VA,%A,V,ARTICLE
 I '($D(@etuat@("OPTIMUM"))) S @etuat@("Valeur Atelier")=VLIMI Q
 S ND=@etuat@("OPTIMUM"),VA=0
 S ARTICLE="" F %A=0:0 S ARTICLE=$O(@etuatag@(ARTICLE)) Q:ARTICLE=""  S V=$$PULLVAL^%TXPPRIM(ARB,ND,"VALEUR.JAUGE",ARTICLE) S:V="" V=VLIMI S @etuata@("Valeur Jauge")=V,VA=VA+V I VA'<VLIMI S VA=VLIMI Q
 S @etuat@("Valeur Atelier")=VA
 Q
 
VALETU(ETUDE) 
 N VA,%A,V,ATELIER
 S VA=0
 S ATELIER="" F %A=0:0 S ATELIER=$O(@etuatg@(ATELIER)) Q:ATELIER=""  S V=$S($D(@etuat@("Valeur Atelier")):@etuat@("Valeur Atelier"),1:VLIMI),VA=VA+V I VA'<VLIMI S VA=VLIMI Q
 S @etu@("Valeur")=VA
 Q
 ;

