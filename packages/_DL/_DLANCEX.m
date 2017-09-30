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

;%DLANCEX^INT^1^59547,73867^0
DLANCEX ;
 
 
 
 
 
 
 
 
 
EXT(MAP,ETUDE,NL,SENS,CAPLIM,DELIMIT,MODEX,VISU,DECAL,COCONT,NBITER,RES,ERREX) 
 
 N REP,REPA,ADR,ART,DEL,DELIM,LAN,LIEN,OPM,OR,STA,TAB,TEMP,TYP,DJ
 N ERR,STECA,STECO,STLA,QU,REPLIEN,INVLIEN,ATLIEN,STAT,LIENINV
 N PERE,TETE,MES,ADETU,ERRNONBL,DATDUJ,FAMTEC,TRI,TRIND
 D POCLEPA^%VVIDEO
 
 S REP=$$LAN^%DLCON2,REPA=$$ART^%DLCON2
 S DJ=$$DATEJAL^%DLCON2,DATDUJ=$P($H,",")
 
 S LIEN=$$LIEN1^%QSGEL2(REP,REPA,3)
 S REPLIEN=$$NOMINT^%QSF("LIEN")
 S LIENINV=$$LINV^%DLCON2
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TEMP") K @(TEMP)
 S TAB=$$CONCAS^%QZCHAD(TEMP,"TAB")
 S OPM=$$CONCAS^%QZCHAD(TEMP,"OPM")
 S SENS=$S(SENS=$$^%QZCHW("AVAL"):1,1:-1)
 K:RES'="" @(RES)
 S ERREX=0
 
 S TRI=$$^%QSCALVA("L0",NL,"TRIABLE")
 I TRI="OUI" S ADR=$$ADRLT^%QSGEST7(NL),TRIND=""
 I TRI'="OUI" S ADR=$$ADRLIS^%QSGEST7(NL),LAN=""
 I (ADR="")!(ADR=0) D INSERR^%DLUTIL("","",10,RES) S ERREX=10 G FEXT
 S STECO=$$^%QZCHW("EN COURS")
 S STECA=$$^%QZCHW("EN CARNET")
 S STLA=$$^%QZCHW("LANCE")
BCL 
 
 I TRI'="OUI" S LAN=$O(@ADR@(LAN)) I LAN="" D FIN^%DLJEVAL G FEXT
 
 I TRI="OUI" S TRIND=$O(@ADR@(TRIND)) I TRIND="" D FIN^%DLJEVAL G FEXT
 I TRI="OUI" S LAN=@ADR@(TRIND)
 S DELIM=DELIMIT
 S DEL=$P($$^%QSCALVA(REP,LAN,$$DELAI^%DLCON2),",",1)
 I DEL="" D INSERR^%DLUTIL($$RLAN^%DLCON2,LAN,13,RES) S ERREX=13 G BCL
 I DEL<DELIM D INSERR^%DLUTIL($$RLAN^%DLCON2,LAN,32,RES) S ERREX=32 G BCL
 I SENS=1 S TYP=DEL,DEL=DELIM,DELIM=TYP
 S QU=$$^%QSCALVA(REP,LAN,"QUANTITE")
 I QU="" D INSERR^%DLUTIL($$RLAN^%DLCON2,LAN,16,RES) S ERREX=16 G BCL
 
 K @(TAB),TYP
 D MVG^%QSCALVA(REP,LAN,LIEN,TAB,.TYP)
 S GAM=$$^%QSCALIN(REP,LAN,"GAMME",1)
 I GAM="" D INSERR^%DLUTIL($$RLAN^%DLCON2,LAN,20,RES) S ERREX=20 G BCL
 S OR="",STA=""
BCA 
 D FIN^%DLJEVAL
 S OR=$O(@TAB@(OR)) I OR="" D:(MODEX'=1)&(STA'=STECO) AFF^%DLNOMG(REP,LAN,"STATUT","LANCE",1) G BCL
 S ERRNONBL=0
 S ART=@TAB@(OR),PERE=ART
 S STA=$$^%QSCALIN(REP,LAN,"STATUT",1)
 S TYPLAN=$$AIR^%QSGE5(REPA,ART,LIENINV)
 S TETE=ART
 D INIGLOB^%DLJEVAL(REPA,REP,ART,LAN)
 K @(OPM)
 G:STA=STECA LCAR
 G:STA=STLA LCAR
 G:STA'=STECO BCA
 
 ;;; En cours : jalonnement partiel
 
 S STAT=$$^%QSCALVA(REP,LAN,"STADE")
 G:STAT="" BCA
 K ^RESSOUR($J)
 
 I TYPLAN D ^%DLNOMPA(REP,LAN,ART,GAM,QU,DEL,DELIM,SENS,CAPLIM,STAT) K @(OPM) G PARF
 
 D PARTIEL^%DLGPART(MAP,STAT,DECAL,COCONT,NBITER,.ERR,RES)
PARF 
 S:ERR'=0 ERREX=ERR
 K ^RESSOUR($J)
 
 I ERR=34 D FIN^%DLJEVAL G FEXT
 G BCA
 
LCAR ;;; En carnet : jalonnement total
 
 
 I TYPLAN D ^%DLNAVAL(MAP,REP,LAN,ART,GAM,QU,DEL,DELIM,SENS,CAPLIM,MODEX,DECAL,COCONT,NBITER) K @(OPM) D:ERRNONBL INSERR^%DLUTIL(REPA,ART,ERRNONBL,RES) G BCA
 
 
 I '($$AIR^%QSGE5(REP,LAN,DJ)) D:MODEX'=1 INIT^%DLNOMG2(REP,LAN) G LCARG
 D:MODEX'=1 RETRAIT^%DLLANC2(REP,LAN,"","")
LCARG K ^RESSOUR($J)
 S FAMTEC=$$CONCAS^%QZCHAD(TEMP,"FAM.TEC")
 K @(FAMTEC)
 S @FAMTEC=$$^%QSCALVA(REPA,ART,$$FAMILLE^%DLCON2)
 S:@FAMTEC="" @FAMTEC="*"
 S @FAMTEC@(1,ART)=@FAMTEC
 S @FAMTEC@(2,@FAMTEC)=ART
 D JALT^%DLGAMME(MAP,REPA,LAN,ART_","_GAM,"DE.PERE.INCONNU",QU,SENS,CAPLIM,$$MACH^%DLCON2,$$MACHINE^%DLCON2,$$DUFAB^%DLCON2,DEL,DELIM,MODEX,FAMTEC,DECAL,COCONT,NBITER,.ERR,OPM,RES)
 K @(FAMTEC)
 G:ERR'=0 AFFRES
 S I="" F %I=0:0 S I=$O(@OPM@(I)) Q:I=""  S @OPM@(I,6)=ART_","_GAM
 
 
AFFRES 
 G:(ERR=0)&(MODEX'=1) STORES
 G:ERR=0 BCA
 S ERREX=ERR
 D INSERR^%DLUTIL(REPA,ART,ERR,RES)
 
 I ERR=34 D FIN^%DLJEVAL G FEXT
 G BCA
 
STORES S DX=0
 I VISU S MES=$$^%QZCHW("Stockage du resultat") D MSG^%VZEATT(MES) S DX=$L(MES)+2
 D STOCK^%DLLANCT(REP,LAN,ART_","_GAM,OPM,DX)
 G BCA
 
FEXT D STOETU(RES,ETUDE)
 K @(TEMP)
 Q
 
STOETU(RES,ETU) 
 N ADETU
 S ADETU=$$CONCAS^%QZCHAD($$ADDETU,ETU)
 K @(ADETU)
 D GLOCOP^%QCAGLC(RES,ADETU)
 Q
 
ADDETU() 
 Q "^[QUI]RQSGLO(""JALON"",""ETUDE"")"
 
ADDETU2() 
 Q "^[QUI]RQSGLO(""JALON"",""ETUDE"""

