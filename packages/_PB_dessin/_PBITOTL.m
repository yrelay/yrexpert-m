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

;%PBITOTL^INT^1^59547,73873^0
PTITOTAL(ETUDE,TAILLE) 
 N PAPIER,TOTAL S TOTAL=1,PAPIER=0
DEB N ALL,ARB,ARBI,ARBS,ARTO,ARTV,DIST,FIRST,N,%N,N1,%N1,PO,POR,O,OI,OR,P,%P
 N PARAMETR,PARN,PART,PERN,PERT,PINTER,R,RAC,REF,STOP,T,%T,T1,%T1,TT,V,VI
 N TEMP,UC,TEMP1
 S UC=$$TABID^%INCOIN("ORDINATEUR")
 I UC="VAX" S TEMP="TEMP1"
 I UC'="VAX" S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S PARAMETR=$$CONCAS^%QZCHAD(TEMP,"PARAMATR")
 S PINTER=$$CONCAS^%QZCHAD(TEMP,"PINTER")
 K @(TEMP)
 D:'(PAPIER) CLEPAG^%VVIDEO
 D POCLEPA^%VVIDEO W "Un instant ..." D ^TOCPETUD(ETUDE,"REF")
 S T=-1 F %T=0:0 S T=$N(REF(2,T)) Q:T=-1  S N=-1 F %N=0:0 S N=$N(REF(2,T,N)) Q:N=-1  D TN
 I '($D(PART)) D POCLEPA^%VVIDEO,^%VSQUEAK W "Impossible de representer graphiquement cette etude ... [RETURN]" R *R:^TOZE($I,"ATTENTE") D POCLEPA^%VVIDEO,FIN Q
 S T=-1 F %T=0:0 S T=$N(ARTO(T)) Q:T=-1  I T'=0 S N=-1 F %N=0:0 S N=$N(ARTO(T,N)) Q:N=-1  D TN2
 G:TOTAL'="" TOT
 D CLEPAG^%VVIDEO,PERT,^%QUCHOYN("REF(1)","ALL") D:'($D(ALL)) FIN Q:'($D(ALL))  G TOTAL
TOT I TOTAL D PERT G TOTAL
AGAIN S PERN=$$^%QUCHOYO("REF(1)",.R,1) I PERN="" D FIN Q
 S PERT=$N(REF(1,PERN,-1))
TOTAL D:'(PAPIER) CLEPAG^%VVIDEO
 I PAPIER D INIT3^%PBMFN(ARTO(PERT,PERN),ARTV(PERT,PERN),XP,YP) G TOTS
 I '(PAPIER) D INIT^%PBMFN(ARTO(PERT,PERN),ARTV(PERT,PERN))
 S DIST=$J($$LEC^%PBSOV(ARTO(PERT,PERN),ARTV(PERT,PERN),"MESURE")/TAILLE,1,0)
 D ^%PBPZGRA,CADRE^%PBP5EC2,MESUR^%PBP5EC2(DIST),^%PBIMPLA
 I '(PAPIER),%TERM'="PT-100G" D EFFBAS^%PBMEN,AFF^%PBMEN(0,0," Etude : "_ETUDE) G TOTS
 D ^%PBPZALF,POCLEPA^%VVIDEO
 D ^%PBPZALF,REV^%VVIDEO S DX=0,DY=0 X XY W " Etude : " S DX=$X+1 D BLD^%VVIDEO X XY W ETUDE D NORM^%VVIDEO
TOTS S FIRST=1 D RECUR^%PBITOT2(PERT,PERT,PERN,.TT)
 I PAPIER D FIN Q
 
 D EFFBAS^%PBMEN,AFF^%PBMEN(0,0,"[RETURN]")
 R *R D ^%PBPZGRA,^%PBPZCLR,^%PBPZALF,FIN^%PBMFN,CLEPAG^%VVIDEO G:'(TOTAL) AGAIN
 D FIN
 Q
TN S O=$S($D(^[QUI]TVPAR(ETUDE,T,"OBJET.GRAPHIQUE")):^[QUI]TVPAR(ETUDE,T,"OBJET.GRAPHIQUE"),1:N)
 I '($D(^[QUI]GRAPHE2(O))) D M("Aucun objet graphique "_O) Q
 S V=$S($D(^[QUI]TVPAR(ETUDE,T,"VERSION")):^[QUI]TVPAR(ETUDE,T,"VERSION"),1:$N(^[QUI]GRAPHE2(O,-1)))
 I '($D(^[QUI]GRAPHE2(O,V))) D M("Aucun objet "_O_" version "_V) Q
 D ADD(ETUDE,T,"OBJET.GRAPHIQUE",O)
 D ADD(ETUDE,T,"VERSION",V)
 D ADD(ETUDE,T,"ANGLE.ROTATION",0)
 D ADD(ETUDE,T,"COEFFICIENT.AGRANDISSEMENT",1)
 S:'($D(PART)) PART=T,PARN=N S ARTO(T,N)=O,ARTV(T,N)=V Q
TN2 S (PO,POR,OR)=""
 S:$D(^[QUI]TVPAR(ETUDE,T,"POINT.DE.RACCORD")) PO=^[QUI]TVPAR(ETUDE,T,"POINT.DE.RACCORD")
 S:$D(^[QUI]TVPAR(ETUDE,T,"OBJET.DE.RACCORD")) OR=^[QUI]TVPAR(ETUDE,T,"OBJET.DE.RACCORD")
 S:$D(^[QUI]TVPAR(ETUDE,T,"POINT.OBJET.DE.RACCORD")) POR=^[QUI]TVPAR(ETUDE,T,"POINT.OBJET.DE.RACCORD")
 I ((POR="")!(PO=""))!(OR="") D M("Impossible de raccorder "_N) Q
 D ADD(ETUDE,T,"POINT.DE.RACCORD",PO),ADD(ETUDE,T,"OBJET.DE.RACCORD",OR)
 D ADD(ETUDE,T,"POINT.OBJET.DE.RACCORD",POR)
 S ARBI(N,OR)="",ARB(OR,N)="" Q
TN3 Q:(N1=N)&(T1=T)  S O=ARTO(T1,N1),V=ARTV(T1,N1)
 S P=-1 F %P=0:0 S P=$N(^[QUI]GRAPHE2(OI,VI,0,"NOMS",P)) Q:P=-1  I $D(^[QUI]GRAPHE2(O,V,0,"NOMS",P)) S STOP=1 Q
 Q
M(M) D POCLEPA^%VVIDEO W "   ",M," ..." H 2 D POCLEPA^%VVIDEO Q
ADD(N,T,A,V) Q:$D(^[QUI]TVPAR(N,T,A))
 S ^[QUI]TVPAR(N,T,A)=V,^[QUI]RAISON(N,T,A)="IMPLICITEMODIFICATION" Q
PARTI(ETUDE,TWREF,TAILLE) N TOTAL,PAPIER S (TOTAL,PAPIER)=0 G DEB
COMPO(ETUDE,TWREF,TAILLE) N TOTAL,PAPIER S TOTAL="",PAPIER=0 G DEB
PAPIER(ETUDE,XP,YP,TAILLE) N TOTAL,PAPIER S (TOTAL,PAPIER)=1 G DEB
PERT S PERN=$N(ARBI(-1)) I PERN=-1 S PERN=PARN,PERT=PART Q
P2 I $D(ARBS(2,PERN)) S PERT=$N(ARBS(1,-1)),PERN=ARBS(1,PERT) Q
 S N=$N(ARBI(PERN,-1)),PERT=$N(REF(1,PERN,-1)) G:N=-1 SPERT
 S ARBS(1,PERT)=PERN,ARBS(2,PERN)=PERT,PERN=N G P2
SPERT Q:PERT'=-1  S PERN=$N(ARB(PERN,-1)),PERT=$N(REF(1,PERN,-1)) G SPERT
FIN K @(TEMP) Q

