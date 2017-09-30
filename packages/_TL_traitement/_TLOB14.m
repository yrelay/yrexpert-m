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

;%TLOB14^INT^1^59547,74030^0
%TLOB14 ;;12:29 PM  8 Sep 1993; ; 08 Sep 93 12:26 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
PARCOI(IDEB,NBREG) 
 N XNEXT,XEVPDS,TEMP,TRS,TPD,TPDV,NUMSTR,TOT,XXN,ATTTRI,TXPLO,MXPLO
 N LARGEUR,LONGUEUR,ATSTRI,PSTRI,PRFMAX
 
 N VAL1,VAL2,VAL3,VAL4,RESUL
 S VAL1=V(IDEB),VAL2=V(IDEB+1),VAL3=V(IDEB+2)
 
 S TPD=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"IK"),LARGEUR=0,LONGUEUR=0
 S NUMSTR=$$GEN^%QCAPOP("STR")
 S TEMP=$$CONCAS^%QZCHAD(TPD,NUMSTR) K @(TEMP)
 S TRSDK=$$CONCAS^%QZCHAD(TEMP,"T")
 S MXPLO=$S(NBREG<9:"NORMAL",(V(IDEB+8)'="PROFONDEUR")&(V(IDEB+8)'="LARGEUR"):"NORMAL",1:V(IDEB+8))
 S TXPLO=$S(NBREG<10:2,(V(IDEB+9)'=0)&(V(IDEB+9)'=1):2,1:V(IDEB+9))
 S PRFMAX=$S(NBREG<11:9999,(V(IDEB+10)=0)&(V(IDEB+10)=1):9999,1:V(IDEB+10))
 S PSTRI=1,XEVPDS=""
BCLAT G:(PSTRI+11)>NBREG BCLFIN
 
 S ATSTRI=V((IDEB+PSTRI)+9) G:ATSTRI=$C(0) BCLFIN
 S ATTTRI=$E(ATSTRI,2,$L(ATSTRI))
 S VALPDS=$S(ATTTRI="DEGRE.EXTERIEUR":"$$PDFILS^%QULARB2(CHEM)",ATTTRI="NOMBRE.SUCCESSEURS":"$$PDSUCC^%QULARB2(CHEM)",ATTTRI="PROFONDEUR.DANS.GRAPHE":"$$PDPROF^%QULARB2(CHEM)",1:"$$PDATT^%QULARB("""_VAL1_""",NEX,"""_ATTTRI_""",1)")
 S XEVPDS=XEVPDS_$S($E(ATSTRI)=">":"-",1:"")_VALPDS_"_"",""_"
 S PSTRI=PSTRI+1
 G BCLAT
BCLFIN S XEVPDS="S POIDS="_XEVPDS_"1"
 S XNEXT="S NEX=$$NXTRIAV^%QSTRUC8("""_VAL1_""",INDIV,"""_VAL3_""",NEX)"
 D INIT^%QULARBU(VAL2,XNEXT,XEVPDS,TRSDK,TXPLO,MXPLO,NUMSTR,PRFMAX)
 S MAXL=0,XXN=0 F TOT=0:1 S XXN=$$NEXT^%QULARBU(NUMSTR,XXN) Q:XXN=0  I $L(XXN,",")>MAXL S MAXL=$L(XXN,",")
 S TOT=TOT_","_MAXL
 
 S RESUL=$$AFF^%TLOPT(V(IDEB+5),V(IDEB+6),V(IDEB+3),V(IDEB+4),TOT)
 Q NUMSTR
 
PDATT(REP,IND,ATT,ORD) 
 N VAL
 S VAL=$$^%QSCALIN(REP,IND,ATT,ORD) Q:VAL="" 99999 Q VAL
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
PARCOS(IDEB,NBREG) 
 N IND,TPD,TRSDK,NEXT,PDS
 N VAL1,VAL2,RESUL
 S VAL1=V(IDEB),VAL2=V(IDEB+1)
 S TPD=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"IK")
 S TEMP=$$CONCAS^%QZCHAD(TPD,VAL1)
 S TRSDK=$$CONCAS^%QZCHAD(TEMP,"T")
 S NEXT=$$NEXT^%QULARBU(VAL1,VAL2,.PDS)
 I $L(NEXT,",")>1 S RESUL=$$AFF^%TLOPT(V(IDEB+4),V(IDEB+5),V(IDEB+2),V(IDEB+3),@TRSDK@($P(NEXT,",",$L(NEXT,",")-1)))
 I NEXT'=0 S RESUL=$$AFF^%TLOPT(V(IDEB+9),V(IDEB+10),V(IDEB+7),V(IDEB+8),@TRSDK@($P(NEXT,",",$L(NEXT,","))))
 I NEXT'=0 S RESUL=$$AFF^%TLOPT(V(IDEB+14),V(IDEB+15),V(IDEB+12),V(IDEB+13),PDS)
 Q NEXT
 
 
 
 
 
 
PARCOC(IDEB,NBREG) 
 N TPD,TEMP,VAL1
 S VAL1=V(IDEB)
 S TPD=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"IK") Q:'($D(@TPD))
 S TEMP=$$CONCAS^%QZCHAD(TPD,VAL1) K @(TEMP)
 D NETTOIE^%QULARBU(VAL1)
 Q 1
 
 
 
 
 
 
 
WAIT(IDEB,NBREG) 
 N TEMPS
 S TEMPS=V(IDEB)+0
 H @TEMPS
 Q 1
 
 
 
 
 
 
 
 
 
 
QUEMAND(IDEB,NBREG) 
 N SAIS,BASE,IND
 S SAIS=V(IDEB)
 S BASE=V(IDEB+1)
 S IND=V(IDEB+2)
 
 D SAUVECR^%TLUTIL
 D CLEPAG^%VVIDEO
 D ACTAFF^%QMEAACT("SAISIE.I",SAIS,0,0,78,10,0,11,78,11,BASE,IND,"$$AFFICH^%QMEAROU","AFFECT^%QMEAROU")
 D CLEPAG^%VVIDEO
 Q 1
 
 
 
 
 
PARTAGER(IDEB,NBREG) 
 D PPAL^%TLIACPP(V(IDEB))
 Q 1
 
 
 
ASSISTER(IDEB,NBREG) 
 N NBPB,HFIN
 S HFIN=""
 I NBREG>0,V(IDEB)'=$C(0) S HFIN=$$ADDAT2^%QMDATE($H,V(IDEB))
 S NBPB=$$EXEC^%SGCOSLE(HFIN,1)
 Q 1
 ;

