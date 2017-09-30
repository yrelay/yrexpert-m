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

;%DLCON1^INT^1^59547,73867^0
DLCON1 ;
 
 
 
 
 
 
 
 
STOMO(MODE,MODELE,MSG,ERR) 
 
 
 
 
 
 N I,NOFICHE,ADGR,ART,AG,GO,CH,PB,ADCONF,DUF,DUM,DEL,MAC,LAN,DELANC,LINV
 N DUJAL
 S ADGR=$$ADGR
 S ADCONF=$$ADCONF
 I MODE K @(ADCONF)
 S PB=0
 S NOFICHE=""
 F I=0:0 S NOFICHE=$O(@ADGR@(MODELE,NOFICHE)) Q:NOFICHE=""  S PB=PB!$$VER2
 Q PB
 
VER(MODELE,NOFICHE,MSG,ERR) 
 
 
 
 
 
 Q:(MODELE="")!(NOFICHE="")
 N I,ADGR,ART,AG,GO,CH,PB,ADCONF,DUF,DUM,DEL,MAC,LAN,DELANC,LINV,DUJAL
 S ADGR=$$ADGR
 S PB=$$VER2
 Q PB
 
VER2() I (MODELE="")!(NOFICHE="") Q 1
 N GAMME,OP,GA,OG,ART1,GAMME1,ARTI
 S CH=@ADGR@(MODELE,NOFICHE)
 S ART=$P(CH,"^",1),AG=$P(CH,"^",2),GO=$P(CH,"^",3),LAN=$P(CH,"^",4)
 S DEL=$P(CH,"^",5),DAT=$P(CH,"^",6),DELANC=$P(CH,"^",8)
 S LINV=$P(CH,"^",9),DUJAL=$P(CH,"^",7)
 S MSG=""
 
 D ADD^%VPRIN1(ERR,$$^%QZCHW("verification de la connection du jalonnement au schema")_" "_MODELE_" "_$$^%QZCHW("numero de fiche")_" "_NOFICHE)
 I ART="" S MSG=$$^%QZCHW("repertoire de type ARTICLE inconnu") D ADD^%VPRIN1(ERR,MSG)
 I AG="" S MSG=$$^%QZCHW("lien de type ARTICLE vers GAMME inconnu") D ADD^%VPRIN1(ERR,MSG)
 I GO="" S MSG=$$^%QZCHW("lien de type GAMME vers OPERATION inconnu") D ADD^%VPRIN1(ERR,MSG)
 I $$MODEL^%QSMODEL'=MODELE S MSG=$$^%QZCHW("le schema")_" "_MODELE_" "_$$^%QZCHW("n'est pas installe") D ADD^%VPRIN1(ERR,MSG) Q 1
 I LAN="" S LAN="LANCEMENT"
 S ARTI=$$NOMINT^%QSF(ART)
 I '($$EXREP^%QSGEL2(ARTI)) S MSG=ART_" "_$$^%QZCHW("n'est pas un nom de repertoire") D ADD^%VPRIN1(ERR,MSG)
 I '($$EXILIEN^%QSGEL2(AG)) S MSG=AG_" "_$$^%QZCHW("n'est pas nom de lien") D ADD^%VPRIN1(ERR,MSG)
 I '($$EXILIEN^%QSGEL2(GO)) S MSG=GO_" "_$$^%QZCHW("n'est pas nom de lien") D ADD^%VPRIN1(ERR,MSG)
 I '($$EXILIEN^%QSGEL2(LINV)) S MSG=LINV_" "_$$^%QZCHW("n'est pas nom de lien") D ADD^%VPRIN1(ERR,MSG)
 D LIENR^%QSGEL2(AG,.ART1,.GAMME)
 I ART1'=ARTI S MSG=AG_" "_$$^%QZCHW("n'est pas un lien de")_" "_ART_" "_$$^%QZCHW("mais de")_$$NOMLOG^%QSF(ART1) D ADD^%VPRIN1(ERR,MSG)
 D LIENR^%QSGEL2(GO,.GAMME1,.OP)
 I GAMME1'=GAMME S MSG=GO_" "_$$^%QZCHW("n'est pas un lien de")_" "_$$NOMLOG^%QSF(GAMME)_" "_$$^%QZCHW("mais de")_$$NOMLOG^%QSF(GAMME1) D ADD^%VPRIN1(ERR,MSG)
 S GA=$$LIENI^%QSGEL4(AG)
 I GA="" S MSG=AG_" "_$$^%QZCHW("n'a pas de lien inverse") D ADD^%VPRIN1(ERR,MSG)
 S OG=$$LIENI^%QSGEL4(GO)
 I OG="" S MSG=GO_" "_$$^%QZCHW("n'a pas de lien inverse") D ADD^%VPRIN1(ERR,MSG)
 I '($$LIENINV^%QSGES90(MODELE,ARTI,LINV)) S MSG=LINV_" "_$$^%QZCHW("n'est pas un lien involutif") D ADD^%VPRIN1(ERR,MSG)
 I MSG'="" D ADD^%VPRIN1(ERR,$$^%QZCHW("la connection du jalonnement au schema")_" "_MODELE_" "_$$^%QZCHW("numero de fiche")_" "_NOFICHE_" "_$$^%QZCHW("est incorrecte")) Q 1
 D ADD^%VPRIN1(ERR,$$^%QZCHW("la connection du jalonnement au schema")_" "_MODELE_" "_$$^%QZCHW("numero de fiche")_" "_NOFICHE_" "_$$^%QZCHW("est correcte"))
 Q 0
 
 
 
 
ADUSER() 
 N LI
 S LI=$S(($I+0)=$I:$I,1:""""_$I_"""")
 Q "^["""_QUI_"""]RQSGLO(""JALON"",""CONF.USER"","_LI_")"
 
ADGR() 
 Q "^RQSMDL9(""PLJ"")"
 
VERIF 
 N PB,TEMP,MODELE,MSG,ERR,NOFICHE
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"VERIF") K @(TEMP)
 S ERR=$$CONCAS^%QZCHAD(TEMP,"ERR")
 D ^%VZEATT
 G:'($$CHOIX(.MODELE,.NOFICHE)) FVERIF
 S PB=$$VER(MODELE,NOFICHE,.MSG,ERR)
 D AFFER
FVERIF K @(TEMP)
 Q
 
INSTAL 
 N PB,TEMP,MODELE,MSG,ERR,NOFICHE
 I '($$EXIEXT^%QMDRUTI($$REGSTAND^%QMDRUTI)) D INST^%QMDRSTA
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"VERIF") K @(TEMP)
 S ERR=$$CONCAS^%QZCHAD(TEMP,"ERR")
 D ^%VZEATT
 G:'($$CHOIX(.MODELE,.NOFICHE)) FINS
 S PB=$$VER(MODELE,NOFICHE,.MSG,ERR)
 I PB=1 D AFFER K @(TEMP) Q
 D STOCK^%DLCON2(MODELE,NOFICHE)
FINS K @(TEMP)
 Q
 
AFFER 
 D AFFERR^%QULIMZ(ERR,$$^%QZCHW("problemes ds la connection du jalonnement"))
 Q
 
 
CHOIX(MODELE,NOFICHE) 
 N ADGR,GLCHOIX,COF,I,%I,J,%J
 S ADGR=$$ADGR
 I '($D(@ADGR)) D ^%VZEAVT($$^%QZCHW("Il n'existe aucune configuration"))
 S GLCHOIX=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"CHOIX")
 K @(GLCHOIX)
 S I="" F %I=0:0 S I=$O(@ADGR@(I)) Q:I=""  S J="" F %J=0:0 S J=$O(@ADGR@(I,J)) Q:J=""  S @GLCHOIX@($E(I_" "_J_" "_$TR(@ADGR@(I,J),"^"," "),1,70))=""
 S COF=$$^%QUCHOIS(GLCHOIX,$$^%QZCHW("quelle connection du jalonnement")_" ?")
 K @(GLCHOIX)
 Q:COF="" 0
 S MODELE=$P(COF," "),NOFICHE=$P(COF," ",2)
 Q 1
 
CONFX 
 N RES
 S RES=$$CONF
 Q
 
CONF() 
 N ADUSER,A
 S ADUSER=$$ADUSER
 I '($D(@ADUSER)) D INSTAL Q:'($D(@ADUSER)) 0
 D ^%VZEAVT($$^%QZCHW("la configuration courante est :")_" "_@ADUSER@("DESC"))
 S A=$$POS^%VZEOUI($$^%QZCHW("desirez vous la conserver ? :"),"O",0,23)
 Q:A'=0 1
 D INSTAL
 Q $D(@ADUSER)#10
 
CONFINS() 
 N ADR
 S ADR=$$ADUSER
 I $D(@ADR) Q 1
 D INSTAL Q $D(@ADR)

