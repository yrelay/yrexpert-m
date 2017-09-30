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

;TOPTRESG^INT^1^59547,74874^0
TOPTRESG ;
 
 K ^PARGR($J) D CLEPAG^%VVIDEO S TWREF=0,DX=0,DY=10 X XY W "Voulez vous les resultats graphiques (O/N) ? " R *REP S REP=$C(REP) G:(REP'="O")&(REP'="N") FIN G:REP="N" FIN
ECH G:'($D(^[QUI]TVPAR(NUFA,TWREF,"ECHELLE"))) XX S Y1=^[QUI]TVPAR(NUFA,TWREF,"ECHELLE") G XX1
XX D POCLEPA^%VVIDEO W "A l'echelle : " S DX=$X D ^%VLEC G:(CTRLA=1)!(CTRLF=1) FIN S:Y1="" Y1=1
XX1 S %9ECHD=Y1 I %9ECHD["/" S %92=$P(%9ECHD,"/",1),%93=$P(%9ECHD,"/",2,500) I (%92?.N)&(%93?.N) S %9="S @(""%91=""_%9ECHD)" X %9 S %9ECHD=%91 K %9,%91,%92,%93
 S %9ECHD=0+%9ECHD G:%9ECHD=0 ECH
 I $D(^[QUI]TVPAR(NUFA,TWREF,"VERSION")) S %9VER=^[QUI]TVPAR(NUFA,TWREF,"VERSION") G T0
T0 D POCLEPA^%VVIDEO W "Resultats sur (E)cran ou sur (T)able tracante ("_$$L24^%QSLIB2_" abandon) " S DX=$X D ^TOLECONE Q:CTRLA!CTRLF  G:(Y1'="E")&(Y1'="T") T0 G @Y1
E S %PORT=$S($D(^TABIDENT(WHOIS,"ECRGRA")):^TABIDENT(WHOIS,"ECRGRA"),1:"0"),%TERM=$S($D(^TABIDENT(WHOIS,"TYPECR")):^TABIDENT(WHOIS,"TYPECR"),1:"PT-100G") G T1
T S %PORT=$S($D(^TABIDENT(WHOIS,"TABTRA")):^TABIDENT(WHOIS,"ECRGRA"),1:"TXA3:"),%TERM=$S($D(^TABIDENT(WHOIS,"TYPTAB")):^TABIDENT(WHOIS,"TYPECR"),1:"RD-GL2") G T1
T1 D CLEPAG^%VVIDEO,^%PBPZGRA K ^PARGR($J) D ^%PBPZCLR S %FONC="INIT",(%9NCO,%9NLI)=1 D ^%PBPZ S %FONC="PRENDRE" D ^%PBPZ
 K ^POINCOM($J),^TWREF($J),^DEFTW($J),^PTINIT($J) S NOMTREE="^[QUI]TREEWORK(NUFA",ADR="T2^TOPTRESG" D ^%QCAGTU1,SUIT^TOPTGORD G T3
T2 D ^TO3GREF S DATAC=@NOM,YA=$P(DATAC,"^",1),%9GR=YA
 S %9VER=$S($D(^[QUI]TVPAR(NUFA,TWREF,"VERSION")):^[QUI]TVPAR(NUFA,TWREF,"VERSION"),1:$N(^[QUI]GRAPHE(YA,-1))) G:%9VER=-1 FIN
 D ^TOPTGORD G FIN
T3 
 D GDEB S %9ORD=-1,%NORD=0
T4 D ^%PBPZALF,REV^%VVIDEO,POCLEPA^%VVIDEO W "Voulez-vous la totalite du dessin (O/N) ? [O] : "
 R *C:^TOZE($I,"ATTENTE") D TOUCHE^%INCCLAV(C,.C) G:C=-1 1 F I=1,6,13,78,79 G:I=C @I
 D ^%VSQUEAK G T4
1 Q
6 Q
13 G 79
78 S I=-1
 F %I=0:0 S I=$N(^ORDOBJ($J,I)) Q:I=-1  D TI
 D ^%PBPZGRA,^%PBPZCLR,^%PBPZALF,CLEPAG^%VVIDEO S C=$$^%QUCHOYO("LISTO",.I,1) Q:C=""
 D CLEPAG^%VVIDEO,^%PBPZGRA,DEBG
 S C=LISTO(C),J=1 F I="%NORD","TWREF","%9GR","%9VER" S @I=$P(C,"^",J),J=J+1
 S %9AR=$S($D(^[QUI]TVPAR(NUFA,TWREF,"ANGLE.ROTATION")):^[QUI]TVPAR(NUFA,TWREF,"ANGLE.ROTATION"),1:0),%9ECH=%9ECHD D:%NORD>1 ^TOPTNDEB
 S %9XDEB=$S($D(^[QUI]GRDEFOBJ(%9GR,%9VER,5,"DATA","%9XDEB")):^[QUI]GRDEFOBJ(%9GR,%9VER,5,"DATA","%9XDEB"),1:2000)
 S %9YDEB=$S($D(^[QUI]GRDEFOBJ(%9GR,%9VER,5,"DATA","%9YDEB")):^[QUI]GRDEFOBJ(%9GR,%9VER,5,"DATA","%9YDEB"),1:1500)
 K %9AR,%9XTR,%9YTR,%9ECH D BEG^PTDESGR
 S %9X=300,%9Y=2800,%9MSGE=NUFA_" "_%9GR_" Version "_%9VER,%9TC=9 D ^PTPOSMSG
L22 D ^%PBPZALF,POCLEPA^%VVIDEO,REV^%VVIDEO W "(M)esure,CTRLF Fin"
 R *C D TOUCHE^%INCCLAV(C,.C) F I=1,6,77 G:I=C @("B"_I)
 D ^%VSQUEAK G L11
B1 G BE
B6 G BE
B77 S %9XES=%9ECHD D ^PTMESURE G L22
B73 D HARDCOPY G L22
BE D ^%PBPZALF,POCLEPA^%VVIDEO,REV^%VVIDEO G 78
TI S TWREF=^ORDOBJ($J,I),%NORD=%NORD+1,REF=^DEFTW($J,TWREF),%9GR=$P(REF,"^",1),%9VER=$P(REF,"^",2) S:$N(^[QUI]GRAPHE(%9GR,%9VER,-1))=5 CLE=%9GR_$J("",40-$L(%9GR))_" "_%9VER,LISTO(CLE)=%NORD_"^"_TWREF_"^"_%9GR_"^"_%9VER Q
79 D POCLEPA^%VVIDEO,NORM^%VVIDEO,^%PBPZGRA,DEBG
S79 S %9ORD=$N(^ORDOBJ($J,%9ORD)) G:%9ORD=-1 T5 S TWREF=^ORDOBJ($J,%9ORD),%NORD=%NORD+1,REF=^DEFTW($J,TWREF),%9GR=$P(REF,"^",1),%9VER=$P(REF,"^",2) K REF
 S %9AR=$S($D(^[QUI]TVPAR(NUFA,TWREF,"ANGLE.ROTATION")):^[QUI]TVPAR(NUFA,TWREF,"ANGLE.ROTATION"),1:0),%9ECH=%9ECHD D:%NORD>1 ^TOPTNDEB D BEG^PTDESGR G S79
T5 S %9IDT=$P(^[QUI]TREEWORK(NUFA,0),"^",4)
 S %9X=300,%9Y=2800,%9MSGE=%9IDT_"   "_NUFA_" ech:"_%9ECH_$$PCONF^%INCASTO("NOMHOST")_" - YEXPERT ("_^INCONNE("VERSION")_")",%9TC=9 D ^PTPOSMSG
L11 D ^%PBPZALF,POCLEPA^%VVIDEO,REV^%VVIDEO W "(M)esure,CTRLF Fin"
 R *C D TOUCHE^%INCCLAV(C,.C) F I=1,6,77 G:I=C @("A"_I)
 D ^%VSQUEAK G L11
A1 G AE
A6 G AE
A77 S %9XES=%9ECHD D ^PTMESURE G L11
A73 D HARDCOPY G L11
AE D NORM^%VVIDEO,^%PBPZGRA,^%PBPZCLR O %DOUT U %DOUT W *27,2 C %DOUT
FIN Q
GDEB D ^PTDEFMIN
 S %9ORD=$N(^ORDOBJ($J,-1)) G:%9ORD=-1 FIN
 S TWREF=^ORDOBJ($J,%9ORD),REF=@("^[QUI]TREEWORK(NUFA,"_TWREF_")"),%9GR=$P(REF,"^",1),%9VER=$S($D(^[QUI]TVPAR(NUFA,TWREF,"VERSION")):^[QUI]TVPAR(NUFA,TWREF,"VERSION"),1:$N(^[QUI]GRAPHE(%9GR,-1))) G:%9VER=-1 FIN
 S %9XDEB=$S($D(^[QUI]GRDEFOBJ(%9GR,%9VER,5,"DATA","%9XDEB")):^[QUI]GRDEFOBJ(%9GR,%9VER,5,"DATA","%9XDEB"),1:2000),%9YDEB=$S($D(^[QUI]GRDEFOBJ(%9GR,%9VER,5,"DATA","%9YDEB")):^[QUI]GRDEFOBJ(%9GR,%9VER,5,"DATA","%9YDEB"),1:1500)
 S ^PARGR($J,"%9XDEB")=%9XDEB,^PARGR($J,"%9YDEB")=%9YDEB K REF G FIN
TRICH K ^ORDOBJ($J) S ^ORDOBJ($J,1)="0,1",^ORDOBJ($J,2)="0,2",^ORDOBJ($J,3)="0,3" Q
HARCOPY U %DOUT W *27,*23 Q
DEBG D ^%PBPZCLR,^PTCADRE,^PTCADECH S %9ZES=1000/%9FCV D PECH^TOPTVIEW Q

