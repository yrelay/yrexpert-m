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

;%SDOSTEX^INT^1^59547,73889^0
SDOSTEX ;
 
 
 
 
 
 N %C,%R,OBJ,PK,VERS,X,Y
 N ELEM,GLCOMP,GLOBJ,GLOTYP,GLTEXT,PAG,STO,TEMP,TEMPREF,ROUTREAF,TEMPO
 
SAIS D ^%SDOBJ($$^%QZCHW("Definition textuelle d'un objet"),2,.OBJ,.VERS)
 I OBJ="" Q
 K PK
 D POCLEPA^%VVIDEO
 
 I '($$EXI^%SDOCMS(OBJ,VERS)) D ^%VSQUEAK I $$MES^%VZEOUI($$^%QZCHW("Objet inexistant, voulez-vous le creer")_" ? ","N")'=1 G SAIS
 
 D ISESS^%SDEANTI(OBJ,VERS,.GLOTYP,.TEMPREF,.GLOBJ,.GLCOMP,.GLTEXT,.TEMPO)
 D EXT(OBJ,VERS)
 D ESESS^%SDEANTI(GLOTYP,TEMPREF)
 G SAIS
 
 
 
EDIT(OBJ,VERS) 
 N ELEM,PAG,STO,TEMP,ROUTREAF
 G DEB
 
EXT(OBJ,VERS) 
 
DEB I OBJ="" Q
 D POCLEPA^%VVIDEO
 
 D INIT
 
 D AFF
 
 D ^%QULIMO(0,3,80,19,ELEM,.PAG,"ADD^%SDOSTEX","SUP^%SDOSTEX")
FIN 
 D MAJCOM
 
 
 D MAJVAR^%SDEGES3(OBJ,VERS)
 K @(TEMP)
 Q
 
AFF D CLEPAG^%VVIDEO,CADR
 D REAFF^%QULIMO3(1,1,ELEM,0,3,80,19)
 Q
 
CADR D ^%VZCDB($$^%QZCHW("Definition textuelle de l'objet")_" "_OBJ_" "_$$^%QZCHW("version")_" "_VERS,0)
 D CARSP^%VVIDEO(0,3,19,80,0)
 Q
 
INIT 
 N I,NUM
 D ^%VZEATT
 
 S STO=$$TEXT^%SDOCMS(OBJ,VERS),STO2=$$DEF^%SDOCMS(OBJ,VERS)
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S ELEM=$$CONCAS^%QZCHAD(TEMP,"ELEM")
 
 S NUM=""
 F I=1:1 S NUM=$O(@STO@("COM",NUM)) Q:NUM=""  Q:NUM="COM"  S @ELEM@(NUM)=@STO@("COM",NUM),@ELEM@(NUM,"EXI")=1
 S NUM=""
 F I=1:1 S NUM=$O(@STO@(NUM)) Q:NUM=""  Q:NUM="COM"  D INS
 S PAG=1
 S ROUTREAF="REAFF^%SDOSTEX"
 Q
INS 
 I $D(@ELEM@(I)) S I=I+1 G INS
 S @ELEM@(I)=@STO@(NUM),@ELEM@(I,"EXI")=1
 Q
 
ADD 
 N RES,MERR,ANC,NOM,PRES,NP
 
 I $E(Y1,1)=":" S OK=1,PRES="",RES=Y1 G ADD3
 I CTR'="D" G ADD1
 N NEWEL S NEWEL=$ZP(^[QUI]SDOBJ(OBJ,VERS,"EL",""))+1
 S ANC="",Y1=NEWEL_" ;"_$P(Y1,";",2,99),PRES=""
 G ADD2
ADD1 
 S ANC=$S($D(@ELEM@(P1C,"EXI")):$$GETLBLAN^%VTLBLAN($P(@ELEM@(P1C),";",1)),1:"")
 
 S PRES=$S(ANC="":"",1:$$PRES2^%SDEGEST(ANC))
ADD2 S OK=$$LIGNE^%SDEANT1(Y1,DX,DY,ANC,1,1,.NOM,.RES,.MERR)
 
ADD3 I OK=0 D:PRES'="" GEN^%SDEGEST(ANC,PRES) Q
 S Y1=RES
 I CTR="D" S @LI@(P1C)=RES
 I PRES'="" D GEN^%SDEGEST(NOM,PRES)
 S @ELEM@(P1C,"EXI")=1
 Q:PRES=""  Q:$$TYPELEM^%SDEGEST(OBJ,VERS,NOM)'="POINT"
 S NP=$$NOPTEL^%SDEGEST(OBJ,VERS,NOM)
 S ^[QUI]SDOBJ(OBJ,VERS,"PTR",NP,"X")=$P(PRES,"^",2)
 S ^[QUI]SDOBJ(OBJ,VERS,"PTR",NP,"Y")=$P(PRES,"^",3)
 Q
 
SUP 
 N NUM,ERRMES
 I $E(@ELEM@(P1C),1)=":" S OK=1 Q
 S ERRMES=1,NUM=$P(@ELEM@(P1C)," ;",1)
 D DESTROY^%SDEGES2(NUM,TEMPREF,1,1)
 S OK=1 Q
 
REAFF 
 K RESUL,PATOUCH,AFRESU,DEJALU,REFUSE,STOPUC,CMS,ABENDSCR
 D CLEPAG^%VVIDEO,CADR
 D REAFF^%QULIMO3(1,1,ELEM,0,3,80,19)
 D A18^%QULIMO4
 D REAFF^%AN7
 Q
 
MAJCOM 
 
 K @STO@("COM")
 N NUM,I,CH
 S NUM=""
 F I=1:1 S NUM=$O(@ELEM@(NUM)) Q:NUM=""  S CH=@ELEM@(NUM) I $E(CH,1)=":" S @STO@("COM",NUM)=CH
 Q

