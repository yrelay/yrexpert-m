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

;%QMNF7^INT^1^59547,73879^0
QMNF7 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 Q:'($D(^POS($J)))
 N ME,MMM,GAP,PAGT,NGAP,ADR,CTR,Y1,PERE,TBMOV
 D INIT
ENT D AFF1
SUIT S GAP=$$^%QZCHW("Page")_" "_PGC_"/"_PAGT,DX=40-($L(GAP)\2),DY=5 X XY W GAP
 S DX=0,DY=6 X XY D TETE^%QMNF5
ACT D ^%VQUIKMN(30,80,23,"ME",.ADR,.CTR) Q:CTR="A"
 G:ADR'="" @ADR G ACT
PAGE 
 D POCLEPA^%VVIDEO S Y1=$$^%VZAME1(" "_$$^%QZCHW("Page")_" : ") G:Y1="" SUIT G:'($$ADR^%QZNBN1(Y1)) SUIT S NGAP=Y1 D AFF G SUIT
MOIN 
 S NGAP=PGC-1 D AFF G SUIT
PLUS 
 S NGAP=PGC+1 D AFF G SUIT
 
AFF 
 I '($D(^POS($J,NGAP))) D ^%VSQUEAK Q
 S PGC=NGAP,DX=0,DY=6 D CLEBAS^%VVIDEO
AFF1 N %QX,%QY
 S DY="" F %QY=1:1 S DY=$O(^POS($J,PGC,DY)) Q:DY=""  S DX="" F %QX=0:0 S DX=$O(^POS($J,PGC,DY,DX)) Q:DX=""  X XY W ^POS($J,PGC,DY,DX)
 Q
 
ATTR 
 N X1
 S DY=$O(^POS($J,PGC,"")),DX=$O(^POS($J,PGC,DY,"")) X XY
 S TBMOV="^POS($J,PGC)" D ^%VZEREVS G:(X1="")!((X1<32)&(X1'=13)) SUIT
ACT2 D ^%VQUIKMN(10,80,23,"MMM",.ADR,.CTR)
 I CTR="A" D POCLEPA^%VVIDEO G ACT
 G:ADR'="" @ADR G ACT2
 
IND 
 N BASEC,NOMC,PERE,REFUSE
 S NOMC=^POS($J,PGC,DY,DX,"INT")
 S BASEC=$$REPD^%QSGEL2(BASE,LIEN) I BASEC="" D ^%VZEAVT($$^%QZCHW("Impossible d'acceder aux attributs de l'individu")_"...") G SUIT
 S REFUSE=0,PERE="" D RECH I PERE="" S BASEC=BASE G IND2
 G:BASE=BASEC IND2
 I REFUSE D POCLEPA^%VVIDEO G SUIT
 S NOMC=$$NOMFILS^%QSGES10(BASE,PERE,BASEC,NOMC)
IND2 I $$IR^%QSGEST5(BASEC,NOMC) D CLEPAG^%VVIDEO,^%VZCD0($E($$NOMLOG^%QSF(BASEC)_" : "_NOMC,1,37)),^%QSATTRI(NOMC,BASEC,0,6,80,17),TITRE G ENT
 D ^%VZEAVT($$^%QZCHW("Impossible d'acceder aux attributs de l'individu")_"...")
 G SUIT
 
LIEN 
 N REP,INDLIEN,TABLE,TABLE2,TEMP,NOMIC,ATT,%U,I,BASEC,NOMC,PERE,REFUSE
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S NOMC=^POS($J,PGC,DY,DX,"INT")
 
 S REFUSE=0,PERE="" D RECH
 I REFUSE D POCLEPA^%VVIDEO G SUIT
 
 S BASEC=$$REPD^%QSGEL2(BASE,LIEN) I BASEC="" D ^%VZEAVT($$^%QZCHW("Impossible d'acceder aux attributs de l'individu")_"...") G SUIT
 I '($$QUAL^%QSGEL2(BASEC,LIEN)) D ^%VZEAVT(LIEN_" n'est pas un lien qualifie...") G SUIT
 S NOMIC=$$NOMFILS^%QSGES10(BASE,PERE,BASEC,NOMC)
 S REP=$$LIENI^%QSGEL3
 S INDLIEN=$$NOML^%QSGES20(PERE,NOMC,LIEN,NOMIC)
 
 S TABLE2=$$CONCAS^%QZCHAD(TEMP,"ATTRIBUTS.NON.AUTOR.") K @(TABLE2)
 D PATOUCH^%QSGES19(.TABLE2)
 
 S TABLE=$$CONCAS^%QZCHAD(TEMP,"ATTRIBUTS") K @(TABLE)
 D RIA^%QSGE1(REP,INDLIEN,.TABLE)
 S ATT=""
 F %U=0:0 S ATT=$O(@TABLE2@(ATT)) Q:ATT=""  K @TABLE@(ATT)
 D ATPR^%QMNF10(REP,INDLIEN,.TABLE)
 S %U=""
 F I=1:1 S %U=$O(@TABLE@(%U)) Q:%U=""  S @TABLE@(I,%U)="" K @TABLE@(%U)
 D CLEPAG^%VVIDEO,^%VZCD0($E($$^%QZCHW("LIEN")_" : "_LIEN,1,37))
 D SELECT^%QSATTRI(INDLIEN,REP,0,6,80,17,TABLE),TITRE
 K @(TEMP) G ENT
 
INIT 
 S PAGT=$S($D(^POS($J,PGC)):PGC,1:PGC-1),PGC=1
 S DX=0,DY=5 D CLEBAS^%VVIDEO
 S ME(1)="+"_"^PLUS",ME(1,"EQU")="="
 S ME(2)="-"_"^MOIN",ME(3)="Page"_"^PAGE"
 S ME(4)="Attributs"_"^ATTR"
 
 S DX=0,DY=5 D CLEBAS^%VVIDEO
 S MMM(1)=$$^%QZCHW("Individu courant")_"^IND"
 S MMM(2)=$$^%QZCHW("Individu lien depuis le pere")_"^LIEN"
 S MMM(3)=$$^%QZCHW("Fin")_"^FIN"
 Q
 
RECH 
 N %UY,%UX,%UP
 S %UX=DX,%UY=DY,%UP=PGC
LOOP S %UY=$ZP(^POS($J,%UP,%UY))
 I %UY="" S REFUSE=1,%UP=$ZP(^POS($J,%UP)) G FIN:%UP="" S REFUSE=0 G LOOP
 S %UX=$O(^POS($J,%UP,%UY,""))
 I %UX'<DX G LOOP
 S PERE=^POS($J,%UP,%UY,%UX,"INT")
 Q
 
FIN Q
 
TITRE D CLEPAG^%VVIDEO,^%VZCD0($E($$NOMLOG^%QSF(BASE)_":"_NSS_"/"_LIEN_"...",1,37))
 Q

