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

;%DLANCUC^INT^1^59547,73867^0
%DLANCUC ;
 
 
 
 
LAN(IND) 
 Q:%AJM="M"
 N REP,MSG
 S REP=$$LAN^%DLCON2,REFUSE=1
 I $$IR^%QSGEST5(REP,IND) D ^%VZEAVT($$^%QZCHW("Ce lancement existe deja")) Q
 
NOK S MSG=$$NOMOK^%QSGEIND($$RLAN^%DLCON2,IND)
 I MSG'="" D ^%VZEAVT(MSG) Q
 S REFUSE=0 Q
 
LAN2 
 Q:%AJM="M"
 N MSG,REP,IND
 S IND=RESUL(ICC) Q:IND=""
 S REP=$$LAN^%DLCON2,REFUSE=0
 I IND="?" D LISTIND^%VYREP(REP) G:REFUSE=0 RECL Q
 
 I '($$IR^%QSGEST5(REP,IND)) D NOK Q:REFUSE=1  D ^%VZEAVT($$^%QZCHW("Veuillez definir le lancement en saisissant les autres champs")) Q
 
RECL S REFUSE=$$EXETU(RESUL(1),IND,0) D POCLEPA^%VVIDEO
 Q:REFUSE=1
 
 D RECUP^%DLETUD2(RESUL(3),"RESUL")
 F IND=5:1:10 S PATOUCH(IND)=1
 D ^%VAFISCR
 Q
 
EXETU(E,L,T) 
 N ETU,REP
 S REP=$$LAN^%DLCON2
 S ETU=$$^%QSCALVA(REP,L,"ETUDE")
 I ETU="" Q 0
 I ETU=E Q 0
 G:T EXETU2
 D ^%VZEAVT($$^%QZCHW("le lancement")_" "_L_" "_$$^%QZCHW("est deja l'objet de l'etude")_" "_ETU)
 I $$MES^%VZEOUI($$^%QZCHW("Voulez-vous la conserver")_" ? ","N")=1 Q 1
EXETU2 D SUP^%DLETUD2(ETU)
 I T D:MODEX=2 STIND^%TLBAATT($$REP^%DLETUDE,ETU,"","","SUPPRESSION")
 Q 0
 
LIST 
 S (REFUSE,STOPUC)=0
 Q:RESUL(ICC)=""
 I RESUL(ICC-1)'="" S (REFUSE,STOPUC)=1 Q
 I RESUL(ICC)="?" G LIS
 D IND^%VYREP("L0") I REFUSE=1 D ^%VZEAVT($$^%QZCHW("Liste inconnue")) Q
 
 S (REFUSE,STOPUC)='($$BASE^%QSGEST7(RESUL(ICC))=$$LAN^%DLCON2)
 I REFUSE D ^%VZEAVT($$^%QZCHW("Cette liste ne contient pas des")_" "_$$RLAN^%DLCON2)
NBI 
 N ADR,CARD,I
 S ADR=$$ADRLIS^%QSGEST7(RESUL(ICC))
 S I=""
 F %I=0:0 S I=$O(@ADR@(I)) Q:I=""  S REFUSE=$$EXETU(RESUL(1),I,0) Q:REFUSE=1
 D POCLEPA^%VVIDEO Q:REFUSE=1
 F I=5:1:10 S PATOUCH(I)=1
 
 
 S CARD=$$CARD^%QSGEST7(RESUL(ICC))
 I CARD'=1 Q
 S RESUL(ICC-1)=$O(@ADR@(""))
 D RECUP^%DLETUD2(RESUL(ICC-1),"RESUL")
 D ^%VAFISCR
 Q
LIS 
 N GL,%I,IND,GLAFF
 S GLAFF=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLAFF") K @(GLAFF)
 S GL=$$LISTIND^%QSGEST6("L0")
 D ^%VZEATT,^%QSGES13("L0","BASE",$$LAN^%DLCON2,1,GLAFF)
 I '($D(@GLAFF)) S (REFUSE,STOPUC)=1 D ^%VZEAVT($$^%QZCHW("Aucune liste")) Q
 D AFF^%VYREP(GLAFF)
 K @(GLAFF) Q:REFUSE=1
 G NBI
 
DELUC 
 N DEL,REP,ATR
 S REP=$$LAN^%DLCON2,ATR=$$DELAI^%DLCON2,REFUSE=0
DEL S DEL=RESUL(ICC)
 I DEL="" S DEL=$$DATE^%QMDATE
 I '($$FINT^%QMDAUC(REP,ATR,.DEL)) D ^%VZEAVT($$^%QZCHW("La date n'a pas une forme correcte")) S REFUSE=1 Q
 S TAB(ICC)=$J("",$L(RESUL(ICC))) D ^%VAFFICH
 S TAB(ICC)=$$AFFI^%QMDAUC(REP,ATR,DEL) D ^%VAFFICH
 Q
 
DATLIM 
 N DEL,ATR,REP
 S REP=$$REP^%DLETUDE,ATR="DATE.LIMITE.DEBUT"
 G DEL
 
NOMART 
 Q:%AJM="M"
 N REP,LIEN
 S REP=$$ART^%DLCON2
 
 D LISTIND^%VYREP(REP) Q:REFUSE=1
 D IND^%VYREP(REP)
 I REFUSE=1 D ^%VZEAVT($$NOMLOG^%QSF(REP)_" "_$$^%QZCHW("inexistant")) Q
 
 S LIEN=$$LIEN1^%QSGEL2($$LAN^%DLCON2,REP,3)
 I $$EXILIEN^%QSGES21(RESUL(1),LIEN,RESUL(ICC)) D ^%VZEAVT($$^%QZCHW("Ces individus sont deja lies")) S REFUSE=1
 Q
 
NOMGAM(ART) 
 N REP,LIEN,GAM,CH,REPA,TEMPG,O,%O,V
 I ART="" S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Veuillez definir l'article en premier")) Q
 S REP=$$RGAMME^%DLCON2,REPA=$$ART^%DLCON2,LIEN=$$AG^%DLCON2
 I RESUL(ICC)="" S TAB(ICC)=$$^%QSCALVA(REPA,ART,LIEN) D ^%VAFFICH
 I RESUL(ICC)'="?" G EXG
 I '($$AIR^%QSGE5(REPA,ART,LIEN)) D ^%VZEAVT($$^%QZCHW("Aucune")_" "_REP) S REFUSE=1 Q
 
 S TEMPG=$$TEMP^%SGUTIL
 S O="" F %O=0:0 S O=$$NXTRIAO^%QSTRUC8(REPA,ART,LIEN,O) Q:O=""  S V=$$VALEUR^%QSTRUC8(REPA,ART,LIEN,O),@TEMPG@(V)=""
 S CH=$$SELECT^%QSGEST6(TEMPG,REP_" de "_ART)
 K @(TEMPG)
 D ^%VAFIGRI,^%VAFISCR
 I CH="" S REFUSE=1
 S TAB(ICC)=CH D ^%VAFFICH Q
EXG S GAM=RESUL(ICC)
 S RESUL(ICC)=ART_","_RESUL(ICC)
 D IND^%VYREP($$GAMME^%DLCON2)
 S RESUL(ICC)=GAM
 I REFUSE=1 D ^%VZEAVT(REP_" "_$$^%QZCHW("inexistante")) Q
 I $$GAM(ART,RESUL(ICC))=0 S REFUSE=1
 Q
 
GAM(ART,GAM) 
 I $$VAIR^%QSGEST5($$ART^%DLCON2,ART,$$AG^%DLCON2,GAM)=0 D ^%VZEAVT(GAM_" "_$$^%QZCHW("n'est pas une")_" "_$$RGAMME^%DLCON2_" de "_ART) Q 0
 Q 1
 
STAT(ST) 
 S REFUSE=0
 Q:ST="EN CARNET"  Q:ST="LANCE"  Q:ST="EN COURS"  Q:ST="SOLDE"
 D ^%VZEAVT($$^%QZCHW("Le statut doit avoir comme valeur EN CARNET ou LANCE ou EN COURS ou SOLDE"))
 S REFUSE=1 Q
 
ISNUM(VAL) S REFUSE=0
 G:VAL<0 ISNER
 G:'($$ENT^%QZNBN(VAL)) ISNER
 Q
ISNER S REFUSE=1
 D ^%VZEAVT($$^%QZCHW("Un entier positif est attendu..."))
 Q
 
CAPA 
 N P,NON,NONM,OUI,OUIM,SEL,SELM
 S (REFUSE,STOPUC)=0
 S P=$E(RESUL(ICC),1)
 S OUI=$$^%QZCHW("oui"),OUIM=$$^%QZCHW("OUI")
 I (P=$E(OUI))!(P=$E(OUIM)) S TAB(ICC)=OUIM G CA2
 S NON=$$^%QZCHW("non"),NONM=$$^%QZCHW("NON")
 I (P=$E(NON))!(P=$E(NONM)) S TAB(ICC)=NONM G CA2
 S SEL=$$^%QZCHW("selectif"),SELM=$$^%QZCHW("SELECTIF")
 I (P=$E(SEL))!(P=$E(SELM)) S TAB(ICC)=SELM G CA2
 S (REFUSE,STOPUC)=1 Q
CA2 D ^%VAFFICH
 Q

