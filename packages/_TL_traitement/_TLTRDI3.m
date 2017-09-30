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

;%TLTRDI3^INT^1^59547,74031^0
TLTRDI3(T) 
 
 
 
 
 
 N C,I
 D POCLEPA^%VVIDEO
 I $$MES^%VZEOUI($$^%QZCHW("Impression du dialogue ? : "),"O")=1 G 79
 D POCLEPA^%VVIDEO Q
79 D MSG^%VZEATT($$^%QZCHW("Impression en cours ... un instant"))
 D IMPR(T)
 D ^%VZEAVT($$^%QZCHW("Impression terminee ")) Q
 
 
IMPR(T) N L,LMAX,LNO,P,PAGE,TEMP,FICH,TYP,JEU,F,FF,FFF,C
 S P=^TABIDENT(WHOIS,"PRINTER"),LMAX=^TABIDENT(WHOIS,"IMPRCOUR")
 S LNO=0,PAGE=0 C P O P U P
 D TETE,TRAIT C P U 0 Q
 
TRAIT I '($D(^[QUI]TLDIALF(T))) G SSJEU
 N TEMP,CONS,VU,ATT,FICH,L,NB,FICH,TYP,JEU,F,FF,FFF,NUM,AT,L
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S CONS=$$CONCAS^%QZCHAD(TEMP,"CONS")
 S VU=$$CONCAS^%QZCHAD(TEMP,"VU")
 S ATT=$$CONCAS^%QZCHAD(TEMP,"ATT") K @(TEMP)
 S FICH="",L=0,NB=0
 F F=1:1 S FICH=$O(^[QUI]TLDIALF(T,FICH)) Q:FICH=""  S TYP="" F FF=1:1 S TYP=$O(^[QUI]TLDIALF(T,FICH,TYP)) Q:TYP=""  S JEU="" F FFF=1:1 S JEU=$O(^[QUI]TLDIALF(T,FICH,TYP,JEU)) Q:JEU=""  D CONS
 K @ATT@("EXI") S NUM="" W !,?14," "
 F F=1:1 S NUM=$O(@ATT@(NUM)) Q:NUM=""  S AT="" F FF=1:1 S AT=$O(@ATT@(NUM,AT)) Q:AT=""  W AT,"   "
 W ! S L="" F FF=1:1 S L=$O(@CONS@(L)) Q:L=""  S JEU=@CONS@(L),COL=15 W !,JEU S NUM="" F F=1:1 S NUM=$O(@ATT@(NUM)) Q:NUM=""  S AT="" F FF=1:1 S AT=$O(@ATT@(NUM,AT)) Q:AT=""  D ECR
 S LNO=LNO+1 D:LNO>(LMAX-5) TETE
 K @(TEMP) Q
 
ECR 
 I $D(@CONS@(L,AT)) W ?COL,$E(@CONS@(L,AT),1,$L(AT)+2)
 S COL=(COL+$L(AT))+3 Q
 
CONS 
 S CH=^[QUI]TLDIALF(T,FICH,TYP,JEU)
 I '($D(@VU@(JEU))) S L=L+1,@CONS@(L)=JEU
 I $D(@VU@(JEU)) S SL=L,L=@VU@(JEU)
 S ATTS=^[QUI]TLDIAL(T,FICH,TYP),NBATT=$L(ATTS,"^")
 F C=1:1:NBATT S AT=$P(ATTS,"^",C) D:AT'="" INS
 I $D(@VU@(JEU)) S L=SL Q
 S @VU@(JEU)=L Q
INS S:'($D(@ATT@("EXI",AT))) NB=NB+1,@ATT@(NB,AT)="",@ATT@("EXI",AT)=""
 S @CONS@(L,AT)=$P(CH,"^",C)
 Q
 
SSJEU 
 N I
 W !,?14," "
 S FICH="" F I=1:1 S FICH=$O(^[QUI]TLDIAL(T,FICH)) Q:FICH=""  S TYP="" F II=1:1 S TYP=$O(^[QUI]TLDIAL(T,FICH,TYP)) Q:TYP=""  S ATTS=^[QUI]TLDIAL(T,FICH,TYP),NI=$L(ATTS,"^") F III=1:1:NI S ATT=$P(ATTS,"^",III) W:ATT'="" ATT,"   "
 W !,!,!,?14,"Ce dialogue n'a pas de jeux de valeurs"
 Q
 
TETE S PAGE=PAGE+1
 W #
 W !,$$^%QZCHW("Le "),$$DATE^%QMDATE,$$^%QZCHW(" a "),$$HEURE^%QMDATE,?80,$$^%QZCHW("Page : "),PAGE
 W !,?40,$$^%QZCHW("Dialogue : "),T
 W !,!
 S LNO=4 Q

