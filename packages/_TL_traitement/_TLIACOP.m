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

;%TLIACOP^INT^1^59547,74029^0
%TLIACOP ;;02:07 PM  26 Oct 1993; ; 25 Oct 93 10:18 AM
 
 
 
 
 
 
 
 
 
 
 
 
GOCOMPI D SAVVAR,INIVISU^%TLOACTV(MODAF)
 S SAVREG=$$TEMP^%SGUTIL
 S (NIVPIL,DEROUT)=0
 S (PARCO("REP"),PAREXE("REP"))=REP,(PARCO("IND"),PAREXE("IND"))=IND,(PARCO("TRT"),PAREXE("TRT"))=TRT,(PARCO("LIS"),PAREXE("LIS"))=LISTE
 
 S V(-1)=$$AFF^%TLOPT("%",$J,"%NOM.TRAITEMENT.COURANT",1,PAREXE("TRT"))
 S:PAREXE("LIS")'="" V(-1)=$$AJCXT^%TLOPT("%LISTE.COURANTE","L0",PAREXE("LIS"))
 S (PARCO("REG"),PAREXE("REG"))=$O(^[QUI]TTL(PARCO("TRT"),2,""))
 S PARCO("IEL")=1
 G @^REF(QUI,TRT,1,1)
 
 
 
 
 
 
 
 
 
 
 
 
 
BLK999 S DEROUT=0,(PARCO("REG"),PAREXE("REG"))=$O(^[QUI]TTL(PARCO("TRT"),2,PARCO("REG"))) G:PARCO("REG")="" BLK3 S PARCO("IEL")=1
 G @^REF(QUI,PARCO("TRT"),PARCO("REG"),PARCO("IEL"))
 
 
BLK1 S DEROUT=0 F %JJ="TRT","REG","IEL" S PARCO(%JJ)=PAREXE(%JJ)
 G @^REF(QUI,PARCO("TRT"),PARCO("REG"),PARCO("IEL"))
 
 
ENBLK 
ENDBLK 
BLK3 S DEROUT=0 G:NIVPIL=0 RETOURGO
 S %I="" F %II=0:0 S %I=$O(@SAVREG@(NIVPIL,"V",%I)) Q:%I=""  S V(%I)=@SAVREG@(NIVPIL,"V",%I)
 S %I="" F %II=0:0 S %I=$O(@SAVREG@(NIVPIL,"PARCO",%I)) Q:%I=""  S (PARCO(%I),PAREXE(%I))=@SAVREG@(NIVPIL,"PARCO",%I)
 K @SAVREG@(NIVPIL) S NIVPIL=NIVPIL-1 G @^REF(QUI,PARCO("TRT"),PARCO("REG"),PARCO("IEL"))
 
 
BLK4 S HALT=1,NIVPIL=0 D ^%EDEPLG G RETOURGO
 
BLK16 G:NIVPIL=0 RETOURGO
 I @SAVREG@(NIVPIL)'=6 K @SAVREG@(NIVPIL) S NIVPIL=NIVPIL-1 G BLK16
 G BLK3
 
BLK17 I NIVPIL=0 G RETOURGO
 I @SAVREG@(NIVPIL)'=7 K @SAVREG@(NIVPIL) S NIVPIL=NIVPIL-1 G BLK17
 G BLK3
 
 
BLK2 
BLK6 
BLK7 S NIVPIL=NIVPIL+1,@SAVREG@(NIVPIL)=DEROUT,DEROUT=0
 S PARCO("IEL")=PARCO("IEL")+1
 
 F %JJ="PARCO","V" S %I="" F %II=0:1 S %I=$O(@%JJ@(%I)) Q:%I=""  S @SAVREG@(NIVPIL,%JJ,%I)=@%JJ@(%I)
 
 F %I="TRT","REG","IEL","REP","IND","LIS" S PARCO(%I)=PAREXE(%I)
 G @^REF(QUI,PARCO("TRT"),PARCO("REG"),PARCO("IEL"))
 
 
 
FIN 
 S NIVPIL=0 D ^%EDEPLG,NETTOIE^%SYSSEMA(QUI) G RETOURGO
 
 
 
 
 
PLANIFS(TRT,REG) 
 Q $O(^[QUI]TTL(TRT,2,REG))
 
 
PLANIFE(TRT,REG,NATERR) 
 Q $O(^[QUI]TTL(TRT,2,REG))
 
 
 
 
 
 
SAVVAR N %I,%II,%JJ,%GAPPEL,%GAPPCO
 S %GAPPEL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TLIAC") S:'($D(@%GAPPEL)) @%GAPPEL=0 S @%GAPPEL=@%GAPPEL+1,%GAPPCO=$E(%GAPPEL,1,$L(%GAPPEL)-1)_","_@%GAPPEL_")"
 F %JJ="PARCO","V","PAREXE" S %I="" F %II=0:0 S %I=$O(@%JJ@(%I)) Q:%I=""  S @%GAPPCO@("TABLE",%JJ,%I)=@%JJ@(%I)
 F %JJ="DEROUT","NATERR","NIVPIL","SAVREG","%TP1","%TP2","RETOURGO" I $D(@%JJ)#10 S @%GAPPCO@("VAR",%JJ)=@%JJ
 Q
 
 
 
 
RETOURGO K @(SAVREG) D RESVAR G @RETOURGO
 
RESVAR N %I,%II,%JJ,%J,%GAPPEL,%GAPPCO
 S %GAPPEL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TLIAC")
 S %GAPPCO=$E(%GAPPEL,1,$L(%GAPPEL)-1)_","_@%GAPPEL_")"
 S %JJ="" F %J=0:0 S %JJ=$O(@%GAPPCO@("TABLE",%JJ)) Q:%JJ=""  S %II="" F %I=0:0 S %II=$O(@%GAPPCO@("TABLE",%JJ,%II)) Q:%II=""  S @%JJ@(%II)=@%GAPPCO@("TABLE",%JJ,%II)
 S %JJ="" F %J=0:0 S %JJ=$O(@%GAPPCO@("VAR",%JJ)) Q:%JJ=""  S @%JJ=@%GAPPCO@("VAR",%JJ)
 K @(%GAPPCO) S @%GAPPEL=@%GAPPEL-1
 Q
 
ABAND() N ATT
 S RES=0
 D POCLEPA^%VVIDEO
 S ATT=^TOZE($I,"ATTENTE") D STANDONE^%VTOZE("ATTENTE")
 I $$MES^%VZEOUI($$^%QZCHW("Abandon immediat ? : "),"N")'=0 D POCLEPA^%VVIDEO S RES=1
 S:'(RES) ^TOZE($I,"ATTENTE")=ATT
 Q RES

